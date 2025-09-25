import { useState, useCallback, useId } from 'react';
import { AccordionItem, AccordionProps } from './types';

/**
 * Custom hook for managing accordion state and behavior
 * Provides a clean API for accordion functionality
 */
export const useAccordion = ({
  items,
  allowMultiple = false,
  defaultOpenItems = [],
  onToggle,
}: Pick<AccordionProps, 'items' | 'allowMultiple' | 'defaultOpenItems' | 'onToggle'>) => {
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

  const isItemOpen = useCallback(
    (itemId: string) => openItems.has(itemId),
    [openItems]
  );

  const openItem = useCallback(
    (itemId: string) => {
      if (!isItemOpen(itemId)) {
        toggleItem(itemId);
      }
    },
    [isItemOpen, toggleItem]
  );

  const closeItem = useCallback(
    (itemId: string) => {
      if (isItemOpen(itemId)) {
        toggleItem(itemId);
      }
    },
    [isItemOpen, toggleItem]
  );

  const openAllItems = useCallback(() => {
    const allItemIds = items.map((item) => item.id);
    setOpenItems(new Set(allItemIds));
  }, [items]);

  const closeAllItems = useCallback(() => {
    setOpenItems(new Set());
  }, []);

  const getOpenItems = useCallback(() => Array.from(openItems), [openItems]);

  const getClosedItems = useCallback(() => {
    const allItemIds = items.map((item) => item.id);
    return allItemIds.filter((id) => !openItems.has(id));
  }, [items, openItems]);

  const hasOpenItems = openItems.size > 0;
  const hasClosedItems = openItems.size < items.length;

  return {
    // State
    openItems,
    instanceId,
    hasOpenItems,
    hasClosedItems,
    
    // Actions
    toggleItem,
    openItem,
    closeItem,
    openAllItems,
    closeAllItems,
    
    // Getters
    isItemOpen,
    getOpenItems,
    getClosedItems,
  };
};
