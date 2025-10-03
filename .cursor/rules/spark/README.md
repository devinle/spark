# Spark Rules Directory

This directory contains all the rules that power Spark's component generation capabilities.

## Directory Structure

```
.cursor/rules/spark/
├── spark.mdc              # Main entry point and core behavior
├── README.md             # This file
│
├── core/                 # Universal patterns and core functionality
│   ├── patterns.mdc      # Universal component patterns
│   ├── accessibility.mdc # Accessibility standards (WCAG 2.2 AA)
│   ├── testing.mdc       # Testing patterns and strategies
│   └── environment.mdc   # Project detection and environment
│
├── frameworks/           # Framework-specific rules
│   ├── wordpress.mdc     # WordPress (FSE, Gutenberg, 10up)
│   ├── nextjs.mdc       # Next.js (App Router, Server Components)
│   ├── react.mdc        # React patterns (planned)
│   └── README.md        # Framework documentation
│
└── components/           # Component-specific rules
    ├── accordion.mdc     # Accordion component
    ├── card.mdc         # Card component
    ├── carousel.mdc     # Carousel component
    ├── dialog.mdc       # Dialog component
    └── README.md        # Component documentation
```

## File Organization

### Main Entry Point
**`spark.mdc`** - The primary rules file that defines:
- Spark's personality and behavior
- Default approaches and conventions
- Technology-specific naming conventions
- Command patterns and usage
- Integration with Context7 MCP server

### Core Rules (`/core/`)
Universal patterns that apply across all frameworks:
- **patterns.mdc** - Component templates, CSS patterns, JavaScript patterns
- **accessibility.mdc** - WCAG 2.2 AA standards and best practices
- **testing.mdc** - Testing strategies (Jest, PHPUnit, etc.)
- **environment.mdc** - Project detection and environment analysis

### Framework Rules (`/frameworks/`)
Framework and platform-specific rules:
- **wordpress.mdc** - Full Site Editing, Gutenberg blocks, 10up scaffold
- **nextjs.mdc** - App Router, Server Components, Next.js 13+ patterns
- **react.mdc** - React-specific patterns (planned)

Each framework file is self-contained with all patterns specific to that technology stack.

### Component Rules (`/components/`)
Component-specific behavior and variations:
- **accordion.mdc** - Accordion patterns for all frameworks
- **card.mdc** - Card component patterns
- **carousel.mdc** - Carousel/slider patterns
- **dialog.mdc** - Modal and popup patterns

## How Rules Work

1. **User triggers command**: `@spark accordion wordpress`
2. **Cursor loads rules**: Reads `spark.mdc` and related files
3. **Spark analyzes**: Checks framework rules, component rules, and patterns
4. **Spark generates**: Creates component based on combined rules

### Rule Hierarchy

```
User Command
    ↓
spark.mdc (main behavior)
    ↓
frameworks/[framework].mdc (framework-specific)
    ↓
components/[component].mdc (component-specific)
    ↓
core/patterns.mdc (universal patterns)
```

## Adding New Content

### Adding a Framework
1. Create `frameworks/[framework-name].mdc`
2. Follow the template in `frameworks/README.md`
3. Update `spark.mdc` with framework conventions
4. Update `frameworks/README.md` with new framework

### Adding a Component
1. Create `components/[component-name].mdc`
2. Define component patterns for all supported frameworks
3. Update `spark.mdc` to include the new component
4. Update `components/README.md` with component details

### Adding Core Patterns
1. Add to existing files in `core/` if related
2. Create new file in `core/` for new categories
3. Update `spark.mdc` to reference new patterns

## Best Practices

### File Organization
- ✅ Keep framework-specific rules in `/frameworks/`
- ✅ Keep universal patterns in `/core/`
- ✅ Keep component variations in `/components/`
- ✅ Avoid duplication between files

### Documentation
- ✅ Include code examples in all rules
- ✅ Document detection logic clearly
- ✅ Explain "why" not just "how"
- ✅ Keep README files updated

### Maintainability
- ✅ Use clear section headers
- ✅ Keep files focused on one concern
- ✅ Reference related files when needed
- ✅ Update all references when moving files

## Rule Development

### Testing Changes
1. Make changes to rule files
2. Restart Cursor IDE
3. Test with: `@spark [component] [framework]`
4. Verify generated output matches expectations

### Version Control
- Commit rule changes with clear messages
- Document breaking changes
- Update version in relevant files
- Test across multiple frameworks

## Meta Information

**Created:** October 2024
**Last Updated:** October 3, 2025
**Maintained By:** Spark Team
**License:** MIT

---

For questions or contributions, see the main repository README.
