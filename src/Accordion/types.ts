/**
 * Type definitions for the Accordion component
 */

export interface AccordionItem {
  /** Unique identifier for the accordion item */
  id: string;
  /** Title text displayed in the accordion header */
  title: string;
  /** Content to display when the accordion item is expanded */
  content: string | React.ReactNode;
  /** Whether this accordion item is disabled */
  disabled?: boolean;
}

export interface AccordionProps {
  /** Array of accordion items to display */
  items: AccordionItem[];
  /** Visual variant of the accordion */
  variant?: 'default' | 'minimal' | 'bordered' | 'filled';
  /** Size of the accordion */
  size?: 'small' | 'medium' | 'large';
  /** Whether multiple items can be open simultaneously */
  allowMultiple?: boolean;
  /** Array of item IDs that should be open by default */
  defaultOpenItems?: string[];
  /** Additional CSS class name */
  className?: string;
  /** Callback fired when an accordion item is toggled */
  onToggle?: (itemId: string, isOpen: boolean) => void;
  /** Test ID for testing purposes */
  'data-testid'?: string;
}

export interface AccordionState {
  /** Set of currently open item IDs */
  openItems: Set<string>;
}

export interface AccordionContextType {
  /** Function to toggle an accordion item */
  toggleItem: (itemId: string) => void;
  /** Function to check if an item is open */
  isItemOpen: (itemId: string) => boolean;
  /** Whether multiple items can be open */
  allowMultiple: boolean;
  /** Unique instance ID for this accordion */
  instanceId: string;
}

/**
 * Props for individual accordion item components
 */
export interface AccordionItemProps {
  /** The accordion item data */
  item: AccordionItem;
  /** Whether this item is currently open */
  isOpen: boolean;
  /** Function to toggle this item */
  onToggle: () => void;
  /** Unique ID for this item */
  itemId: string;
  /** Instance ID of the parent accordion */
  instanceId: string;
}

/**
 * Configuration options for accordion behavior
 */
export interface AccordionConfig {
  /** Default variant to use */
  defaultVariant: AccordionProps['variant'];
  /** Default size to use */
  defaultSize: AccordionProps['size'];
  /** Whether to allow multiple items open by default */
  defaultAllowMultiple: boolean;
  /** Animation duration in milliseconds */
  animationDuration: number;
  /** Whether to use reduced motion for accessibility */
  respectReducedMotion: boolean;
}

/**
 * Event handlers for accordion interactions
 */
export interface AccordionEventHandlers {
  /** Called when an item is opened */
  onItemOpen?: (itemId: string) => void;
  /** Called when an item is closed */
  onItemClose?: (itemId: string) => void;
  /** Called when any item is toggled */
  onItemToggle?: (itemId: string, isOpen: boolean) => void;
  /** Called when all items are closed */
  onAllItemsClosed?: () => void;
  /** Called when all items are opened */
  onAllItemsOpened?: () => void;
}
