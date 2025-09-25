import React, { useState, useCallback, useId } from 'react';
import styles from './Accordion.module.css';

export interface AccordionItem {
  id: string;
  title: string;
  content: string | React.ReactNode;
  disabled?: boolean;
}

export interface AccordionProps {
  items: AccordionItem[];
  variant?: 'default' | 'minimal' | 'bordered' | 'filled';
  size?: 'small' | 'medium' | 'large';
  allowMultiple?: boolean;
  defaultOpenItems?: string[];
  className?: string;
  onToggle?: (itemId: string, isOpen: boolean) => void;
  'data-testid'?: string;
}

const Accordion: React.FC<AccordionProps> = ({
  items,
  variant = 'default',
  size = 'medium',
  allowMultiple = false,
  defaultOpenItems = [],
  className = '',
  onToggle,
  'data-testid': testId,
}) => {
  const [openItems, setOpenItems] = useState<Set<string>>(
    new Set(defaultOpenItems)
  );
  const accordionId = useId();
  const instanceId = `accordion-${accordionId}`;

  const toggleItem = useCallback(
    (itemId: string) => {
      setOpenItems((prevOpenItems) => {
        const newOpenItems = new Set(prevOpenItems);
        const isCurrentlyOpen = newOpenItems.has(itemId);

        if (isCurrentlyOpen) {
          newOpenItems.delete(itemId);
        } else {
          if (!allowMultiple) {
            newOpenItems.clear();
          }
          newOpenItems.add(itemId);
        }

        onToggle?.(itemId, !isCurrentlyOpen);
        return newOpenItems;
      });
    },
    [allowMultiple, onToggle]
  );

  const handleKeyDown = useCallback(
    (event: React.KeyboardEvent, itemId: string) => {
      if (event.key === 'Enter' || event.key === ' ') {
        event.preventDefault();
        toggleItem(itemId);
      }
    },
    [toggleItem]
  );

  const isItemOpen = useCallback(
    (itemId: string) => openItems.has(itemId),
    [openItems]
  );

  if (!items || items.length === 0) {
    return null;
  }

  return (
    <div
      className={`${styles.accordion} ${styles[`accordion--${variant}`]} ${styles[`accordion--${size}`]} ${className}`}
      data-accordion-id={instanceId}
      data-testid={testId}
      role="region"
      aria-label="Accordion"
    >
      {items.map((item, index) => {
        const isOpen = isItemOpen(item.id);
        const itemId = `${instanceId}-item-${item.id}`;
        const contentId = `${itemId}-content`;
        const headerId = `${itemId}-header`;

        return (
          <div
            key={item.id}
            className={`${styles.accordion__item} ${
              isOpen ? styles['accordion__item--open'] : ''
            } ${item.disabled ? styles['accordion__item--disabled'] : ''}`}
          >
            <h3 className={styles.accordion__header}>
              <button
                id={headerId}
                className={styles.accordion__trigger}
                type="button"
                aria-expanded={isOpen}
                aria-controls={contentId}
                disabled={item.disabled}
                onClick={() => !item.disabled && toggleItem(item.id)}
                onKeyDown={(e) => !item.disabled && handleKeyDown(e, item.id)}
                aria-describedby={item.disabled ? `${itemId}-disabled` : undefined}
              >
                <span className={styles.accordion__title}>{item.title}</span>
                <span
                  className={`${styles.accordion__icon} ${
                    isOpen ? styles['accordion__icon--open'] : ''
                  }`}
                  aria-hidden="true"
                >
                  <svg
                    width="16"
                    height="16"
                    viewBox="0 0 16 16"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M4 6L8 10L12 6"
                      stroke="currentColor"
                      strokeWidth="2"
                      strokeLinecap="round"
                      strokeLinejoin="round"
                    />
                  </svg>
                </span>
              </button>
            </h3>
            <div
              id={contentId}
              className={`${styles.accordion__content} ${
                isOpen ? styles['accordion__content--open'] : ''
              }`}
              aria-labelledby={headerId}
              role="region"
              aria-hidden={!isOpen}
            >
              <div className={styles.accordion__contentInner}>
                {typeof item.content === 'string' ? (
                  <p className={styles.accordion__text}>{item.content}</p>
                ) : (
                  item.content
                )}
              </div>
            </div>
            {item.disabled && (
              <span
                id={`${itemId}-disabled`}
                className="sr-only"
              >
                This section is currently disabled
              </span>
            )}
          </div>
        );
      })}
    </div>
  );
};

export default Accordion;
