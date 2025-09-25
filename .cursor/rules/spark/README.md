# Spark - Your Friendly Component Generator

Spark is a conversational assistant that creates production-ready UI components. It's helpful, encouraging, and makes component generation feel effortless.

## Quick Start

Just type `@spark` to get started, or try:

```bash
@spark accordion    # Create an accordion component
@spark card react   # Create a React card component
@spark help         # Show available options
```

## Available Components

1. **📋 Accordion** - Collapsible sections (FAQs, content organization, step-by-step guides)
2. **⬜ Card** - Content containers (blog posts, products, profiles, media displays)
3. **⭕ Carousel** - Image sliders (galleries, testimonials, hero banners, content rotation)
4. **💬 Dialog** - Modals and popups (confirmations, lightboxes, contact forms, alerts)

## Technology Support

Spark supports multiple technologies with proper naming conventions:

### React/TypeScript/JavaScript
- **Directories**: PascalCase (e.g., `src/TestimonialCarousel/`)
- **Component Files**: PascalCase (e.g., `TestimonialCarousel.tsx`)
- **CSS Modules**: kebab-case (e.g., `testimonial-carousel.module.css`)
- **Hooks**: camelCase starting with 'use' (e.g., `useTestimonialCarousel`)
- **Types/Interfaces**: PascalCase (e.g., `TestimonialCarouselProps`)
- **Constants**: SCREAMING_SNAKE_CASE (e.g., `DEFAULT_AUTOPLAY_DELAY`)

### WordPress/PHP
- **Directories**: kebab-case (e.g., `wp-content/themes/[theme]/components/testimonial-carousel/`)
- **PHP Files**: kebab-case (e.g., `testimonial-carousel.php`)
- **CSS Files**: kebab-case (e.g., `testimonial-carousel.css`)
- **JS Files**: kebab-case (e.g., `testimonial-carousel.js`)
- **Functions**: snake_case (e.g., `render_testimonial_carousel`)
- **Classes**: PascalCase (e.g., `Testimonial_Carousel`)

### Vanilla HTML/CSS/JavaScript
- **Directories**: kebab-case (e.g., `src/testimonial-carousel/`)
- **HTML Files**: kebab-case (e.g., `testimonial-carousel.html`)
- **CSS Files**: kebab-case (e.g., `testimonial-carousel.css`)
- **JS Files**: kebab-case (e.g., `testimonial-carousel.js`)
- **CSS Classes**: kebab-case with BEM (e.g., `.testimonial-carousel__slide`)
- **JS Variables/Functions**: camelCase (e.g., `testimonialCarousel`)

## JavaScript Export Preferences

Spark follows modern JavaScript best practices:

- **Default Exports**: Used for main component/class exports
- **Named Exports**: Used for utilities, types, and secondary exports
- **No Barrel Files**: Avoids index.js files that re-export everything
- **Direct Imports**: Encourages direct imports from specific files

### Example Structure
```
src/TestimonialCarousel/
├── TestimonialCarousel.tsx (default export)
├── testimonial-carousel.module.css
├── useTestimonialCarousel.ts (named export)
├── types.ts (named exports)
└── README.md
```

## Features

- **Accessibility**: WCAG 2.2 AA compliance by default
- **Performance**: CLS prevention, lazy loading, and optimized animations
- **Responsive Design**: Works on all devices
- **TypeScript Support**: Optional for React components
- **Testing**: Includes tests for functionality and accessibility
- **Documentation**: Complete usage examples and customization guides

## Usage Examples

### React Component
```tsx
import TestimonialCarousel from '@/TestimonialCarousel/TestimonialCarousel';

<TestimonialCarousel 
  testimonials={[
    { quote: "Great product!", author: "John Doe", title: "CEO" }
  ]} 
/>
```

### WordPress Component
```php
<?php
include 'components/testimonial-carousel/testimonial-carousel.php';
render_testimonial_carousel($testimonials);
?>
```

### Vanilla HTML
```html
<script src="testimonial-carousel/testimonial-carousel.js"></script>
<div class="testimonial-carousel" data-testimonials='[...]'></div>
```

## Getting Help

- Type `@spark help` for quick reference
- Type `@spark list` to see all available components
- Just type `@spark` to start a conversation about what you need

## Contributing

Spark follows industry best practices for naming conventions and code organization. When contributing:

1. Follow the technology-specific naming conventions
2. Use default exports for main components
3. Avoid barrel files (index.js exports)
4. Include proper accessibility features
5. Add comprehensive documentation

---

*Remember: Spark is not just generating code, it's helping people build better user interfaces. Be the teammate they wish they had.*