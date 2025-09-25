# Accordion Component

A flexible, accessible React accordion component optimized for FAQ sections and content organization. Built with TypeScript and modern React patterns.

## Features

- 🎯 **FAQ Optimized** - Perfect for frequently asked questions and help content
- ♿ **Accessible** - WCAG 2.2 AA compliant with keyboard navigation and screen reader support
- 📱 **Responsive** - Works seamlessly on all device sizes
- 🎨 **Customizable** - Multiple variants, sizes, and styling options
- ⚡ **Performance** - Optimized with React.memo and efficient state management
- 🔧 **TypeScript** - Full type safety and IntelliSense support
- 🎭 **Multiple Instances** - Safe to use multiple accordions on the same page

## Quick Start

```tsx
import Accordion from './Accordion';
import type { AccordionItem } from './types';

const faqItems: AccordionItem[] = [
  {
    id: 'shipping',
    title: 'What is your shipping policy?',
    content: 'We offer free shipping on orders over $50. Standard shipping takes 3-5 business days.'
  },
  {
    id: 'returns',
    title: 'Can I return items?',
    content: 'Yes! You can return items within 30 days of purchase for a full refund.'
  },
  {
    id: 'contact',
    title: 'How can I contact support?',
    content: 'You can reach us at support@example.com or call 1-800-HELP.'
  }
];

function FAQPage() {
  return (
    <Accordion 
      items={faqItems}
      variant="default"
      size="medium"
      allowMultiple={true}
    />
  );
}
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `items` | `AccordionItem[]` | **required** | Array of accordion items to display |
| `variant` | `'default' \| 'minimal' \| 'bordered' \| 'filled'` | `'default'` | Visual style variant |
| `size` | `'small' \| 'medium' \| 'large'` | `'medium'` | Size of the accordion |
| `allowMultiple` | `boolean` | `false` | Allow multiple items to be open simultaneously |
| `defaultOpenItems` | `string[]` | `[]` | Item IDs to be open by default |
| `className` | `string` | `''` | Additional CSS class name |
| `onToggle` | `(itemId: string, isOpen: boolean) => void` | `undefined` | Callback when items are toggled |
| `data-testid` | `string` | `undefined` | Test ID for testing |

## AccordionItem Interface

```tsx
interface AccordionItem {
  id: string;                    // Unique identifier
  title: string;                 // Header text
  content: string | React.ReactNode; // Content to display
  disabled?: boolean;            // Whether item is disabled
}
```

## Variants

### Default
Clean, modern design with subtle shadows and borders.

```tsx
<Accordion items={items} variant="default" />
```

### Minimal
No borders or shadows, perfect for inline content.

```tsx
<Accordion items={items} variant="minimal" />
```

### Bordered
Emphasized borders for better content separation.

```tsx
<Accordion items={items} variant="bordered" />
```

### Filled
Background color with inset shadow for depth.

```tsx
<Accordion items={items} variant="filled" />
```

## Sizes

- **Small**: Compact spacing, smaller text
- **Medium**: Standard spacing and text size (default)
- **Large**: Generous spacing, larger text

## Advanced Usage

### Custom Content

Accordion items can contain any React content:

```tsx
const items: AccordionItem[] = [
  {
    id: 'features',
    title: 'What features are included?',
    content: (
      <div>
        <h4>Core Features:</h4>
        <ul>
          <li>Feature 1</li>
          <li>Feature 2</li>
          <li>Feature 3</li>
        </ul>
        <button>Learn More</button>
      </div>
    )
  }
];
```

### Controlled State

```tsx
const [openItems, setOpenItems] = useState(['shipping']);

const handleToggle = (itemId: string, isOpen: boolean) => {
  console.log(`${itemId} is now ${isOpen ? 'open' : 'closed'}`);
};

<Accordion 
  items={items}
  defaultOpenItems={openItems}
  onToggle={handleToggle}
/>
```

### Disabled Items

```tsx
const items: AccordionItem[] = [
  {
    id: 'coming-soon',
    title: 'Coming Soon Feature',
    content: 'This feature is not yet available.',
    disabled: true
  }
];
```

## Accessibility

The accordion component is built with accessibility in mind:

- **Keyboard Navigation**: Use Tab to focus, Enter/Space to toggle
- **Screen Reader Support**: Proper ARIA labels and roles
- **Focus Management**: Clear focus indicators
- **Reduced Motion**: Respects user's motion preferences
- **High Contrast**: Supports high contrast mode

## Styling

The component uses CSS modules with CSS custom properties for easy theming:

```css
.accordion {
  --accordion-border-color: #e5e7eb;
  --accordion-bg-color: #ffffff;
  --accordion-text-color: #374151;
  --accordion-focus-ring: #3b82f6;
  /* ... more custom properties */
}
```

### Dark Mode

The component automatically adapts to dark mode using `prefers-color-scheme`:

```css
@media (prefers-color-scheme: dark) {
  .accordion {
    --accordion-bg-color: #1f2937;
    --accordion-text-color: #f9fafb;
    /* ... dark mode colors */
  }
}
```

## Performance

- **React.memo**: Prevents unnecessary re-renders
- **useCallback**: Memoizes event handlers
- **Efficient State**: Uses Set for O(1) lookups
- **CSS Transitions**: Hardware-accelerated animations

## Testing

The component includes test IDs for easy testing:

```tsx
<Accordion 
  items={items}
  data-testid="faq-accordion"
/>

// In your tests
const accordion = screen.getByTestId('faq-accordion');
```

## Browser Support

- Chrome 60+
- Firefox 60+
- Safari 12+
- Edge 79+

## FAQ Best Practices

When using this accordion for FAQ sections:

1. **Keep titles as questions** - This helps with SEO and user expectations
2. **Limit to 5-7 items** - Too many can overwhelm users
3. **Use clear, descriptive titles** - Users should know what to expect
4. **Keep answers concise** - 2-3 sentences work best
5. **Link to detailed content** - Don't cram everything into the accordion

## Examples

### FAQ Section
```tsx
const faqItems: AccordionItem[] = [
  {
    id: 'shipping',
    title: 'How long does shipping take?',
    content: 'Standard shipping takes 3-5 business days. Express shipping is available for next-day delivery.'
  },
  {
    id: 'returns',
    title: 'What is your return policy?',
    content: 'We offer a 30-day return policy for all items in original condition.'
  }
];

<Accordion 
  items={faqItems}
  variant="bordered"
  allowMultiple={true}
/>
```

### Product Details
```tsx
const productItems: AccordionItem[] = [
  {
    id: 'specifications',
    title: 'Technical Specifications',
    content: <SpecificationsTable specs={product.specs} />
  },
  {
    id: 'reviews',
    title: 'Customer Reviews',
    content: <ReviewsList reviews={product.reviews} />
  }
];

<Accordion 
  items={productItems}
  variant="minimal"
  size="large"
/>
```

## Troubleshooting

### Common Issues

**Q: Accordion items not opening**
A: Check that your `items` array has valid `id` and `title` properties.

**Q: Styling not applying**
A: Make sure you're importing the CSS module: `import styles from './Accordion.module.css'`

**Q: TypeScript errors**
A: Ensure you're importing the types: `import type { AccordionItem } from './types'`

### Performance Issues

**Q: Slow rendering with many items**
A: Consider pagination or virtual scrolling for large datasets.

**Q: Memory leaks**
A: The component automatically cleans up event listeners, but ensure you're not holding references to closed components.

## License

MIT License - feel free to use in your projects!
