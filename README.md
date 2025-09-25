# Spark - Your Friendly Component Generator

> A conversational component generation system for Cursor IDE that creates production-ready UI components through natural language interaction.

**Built by Fueled** | **Designed for Teams** | **Production-Ready Components**

![Spark Demo](https://via.placeholder.com/800x400/4285f4/ffffff?text=Spark+Demo+Video)

## Quick Start

### One-Line Installation

```bash
curl -fsSL https://raw.githubusercontent.com/devinle/spark/main/install.sh | bash
```

### Manual Installation

```bash
git clone https://github.com/devinle/spark.git
cd spark
chmod +x install.sh
./install.sh
```

### Usage

Open Cursor IDE and start chatting:

```
@spark                    # Let's chat about what you need
@spark accordion          # Create an accordion component
@spark faq                # Quick FAQ accordion
@spark product-card       # E-commerce product card
@spark help               # Show all options
```

## What You Get

**Four Production-Ready Components:**
- 📋 **Accordion** - Collapsible sections for FAQs, content organization, step-by-step guides
- ⬜ **Card** - Content containers for blog posts, products, profiles, media displays  
- ⭕ **Carousel** - Image sliders for galleries, testimonials, hero banners, content rotation
- 💬 **Dialog** - Modals and popups for confirmations, lightboxes, contact forms, alerts

**Multiple Technology Stacks:**
- React (TypeScript & JavaScript)
- WordPress (PHP)
- Vanilla HTML/CSS/JavaScript
- Web Components

**Built-in Best Practices:**
- WCAG 2.2 AA accessibility compliance
- Mobile-first responsive design
- Performance optimizations (CLS prevention, lazy loading)
- Modern JavaScript patterns
- BEM CSS methodology
- Production-ready code quality

## Features

### Conversational Interface
Spark doesn't just generate code - it understands what you're trying to build:

```
You: @spark carousel
Spark: Perfect! Carousels are great for showcasing content.

What are you planning to use this for?
1. Image gallery (optimized for smooth transitions)
2. Testimonials (focused on readable text)
3. Hero banner (autoplay + call-to-action support)
4. Product showcase (thumbnails + zoom features)
```

### Smart Project Detection
Automatically detects your project setup and suggests the best approach:
- Framework detection (Next.js, WordPress, Vanilla)
- TypeScript/JavaScript preference
- Existing design system integration
- Component organization patterns

### One-Click Shortcuts
Quick generation for common use cases:
```
@spark faq              # FAQ accordion
@spark product-card     # Product display card
@spark hero-carousel    # Hero banner carousel
@spark contact-form     # Contact form dialog
```

### Progressive Disclosure
- **Beginner Mode**: Guided, educational experience with explanations
- **Expert Mode**: Fast-track generation with full feature control
- **Power User Flags**: Advanced customization options

## Installation Requirements

- **Cursor IDE** (recommended) - Designed for Cursor's Chat Agent
- **Git** - For installation and updates
- **Node.js 16+** (for React/TypeScript components)
- **PHP 7.4+** (for WordPress components)

Works with any project type:
- Next.js / React applications
- WordPress themes and plugins
- Static HTML sites
- Node.js projects
- Monorepos

## Component Examples

### Accordion Component
Perfect for FAQs, product details, or step-by-step guides:

```typescript
// Generated React component
import { Accordion } from '@/Accordion/Accordion';

<Accordion
  items={[
    { title: "What is your return policy?", content: "30-day returns..." },
    { title: "How do I track my order?", content: "Visit our tracking page..." }
  ]}
  variant="bordered"
  allowMultiple={false}
/>
```

### Card Component
Great for product catalogs, blog previews, team profiles:

```typescript
// Generated React component
import { Card } from '@/Card/Card';

<Card
  title="Premium Headphones"
  image="/images/headphones.jpg"
  price="$299"
  description="High-quality wireless headphones with noise cancellation"
  actions={[
    { label: "Add to Cart", onClick: handleAddToCart },
    { label: "Learn More", href: "/products/headphones" }
  ]}
/>
```

## Architecture

Spark uses a modular rule system that integrates seamlessly with Cursor IDE:

```
.cursor/rules/spark/
├── spark.mdc                 # Main conversational rules
├── components/               # Component-specific patterns
│   ├── accordion.mdc
│   ├── card.mdc
│   ├── carousel.mdc
│   └── dialog.mdc
├── core/                     # Core functionality
│   ├── accessibility.mdc
│   ├── patterns.mdc
│   ├── production.mdc
│   └── testing.mdc
└── README.md
```

Each component includes:
- Conversation patterns for natural interaction
- Multiple technology implementations
- Accessibility guidelines
- Testing strategies
- Performance optimizations
- Usage examples and documentation

## Advanced Usage

### Power User Features

```bash
# Fast-track generation with specific options
@spark accordion react --variant=minimal --theme=dark --type=faq

# Batch component creation
@spark accordion,card react --theme=dark

# Silent mode for CI/CD
@spark card --silent --no-questions --output=src/components/
```

### Team Configuration

Save and share team standards:
```bash
@spark config save faq-accordion --variant=bordered --seo=true
@spark accordion --config=faq-accordion
```

### Custom Variants

Each component supports multiple variants:
- **Variants**: minimal, default, bordered, filled, elevated
- **Themes**: light, dark, auto, brand
- **Sizes**: small, medium, large
- **Types**: Component-specific optimizations

## Updates

Keep Spark current with the latest patterns and improvements:

```bash
# From the spark repository
./update.sh

# Check for updates manually
git pull origin main && ./install.sh
```

## Contributing

We welcome contributions! Spark is built by developers for developers.

### Component Requests
Need a component that's not included? [Open an issue](https://github.com/devinle/spark/issues) with:
- Component description and use case
- Example implementations or designs
- Technology stack requirements

### Pattern Improvements
Found a better way to implement something? Submit a PR with:
- Clear description of the improvement
- Testing across multiple use cases
- Documentation updates

### Development Setup

```bash
git clone https://github.com/devinle/spark.git
cd spark

# Test installation locally
./install.sh

# Test in Cursor IDE
# Open a test project and try @spark commands
```

## Support

### Documentation
- [Component Gallery](https://spark.devinle.com/components) - Browse all available components
- [Usage Examples](./examples/) - See Spark in action across different project types
- [Best Practices](./docs/best-practices.md) - Learn optimal patterns and approaches

### Community
- [GitHub Discussions](https://github.com/devinle/spark/discussions) - Ask questions, share tips
- [Issues](https://github.com/devinle/spark/issues) - Report bugs, request features
- [Twitter](https://twitter.com/devinle) - Follow for updates and announcements

### Troubleshooting

**Spark not responding in Cursor?**
1. Verify installation: `ls .cursor/rules/spark/`
2. Restart Cursor IDE
3. Try `@spark help` to test connection

**Components not generating?**
1. Check Cursor console for errors
2. Verify project permissions
3. Try a different component location

**Need to reset installation?**
```bash
rm -rf .cursor/rules/spark
cd path/to/spark && ./install.sh
```

## Roadmap

**v1.1 (Current)**
- Four core components (Accordion, Card, Carousel, Dialog)
- Multi-stack support (React, WordPress, Vanilla)
- Conversational component generation

**v1.2 (Q1 2025)**
- Additional components (Button, Input, Navigation)
- Theme system and design tokens
- Component composition patterns

**v1.3 (Q2 2025)**
- Visual component builder
- Integration with design systems (Tailwind, Chakra, Material-UI)
- Advanced testing patterns

**Future Considerations**
- VS Code extension compatibility
- Component marketplace
- Team collaboration features

## License

MIT License - feel free to use Spark in your projects and contribute back to the community.

## Built by Fueled

Spark is developed by [Fueled](https://devinle.com), a digital product agency focused on creating exceptional user experiences. We build internal tools that make our team more productive, and we're excited to share them with the broader development community.

---

**Ready to build amazing components?**

```bash
curl -fsSL https://raw.githubusercontent.com/devinle/spark/main/install.sh | bash
```

Then open Cursor and type `@spark` to get started!