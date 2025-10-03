# Framework-Specific Rules

This directory contains framework and platform-specific rules for Spark component generation.

## Structure

Each framework gets its own `.mdc` file with comprehensive patterns, conventions, and best practices specific to that technology stack.

```
frameworks/
├── wordpress.mdc        # WordPress (FSE, Gutenberg, 10up scaffold)
├── nextjs.mdc          # Next.js (App Router, Server Components, RSC)
├── react.mdc           # React-specific patterns (coming soon)
└── README.md           # This file
```

## Current Frameworks

### ✅ WordPress (`wordpress.mdc`)
**Status:** Complete

Comprehensive WordPress development patterns including:
- Full Site Editing (FSE)
- Gutenberg block development (Block API v3)
- Block patterns and variations
- 10up scaffold alignment
- ACF integration
- theme.json integration
- Modern WordPress best practices

**Reference:** `/frameworks/wordpress.mdc`

### ✅ Next.js (`nextjs.mdc`)
**Status:** Complete

Modern Next.js patterns including:
- App Router (Next.js 13+)
- Server Components vs Client Components
- Server Actions
- Metadata API
- Image & Font optimization
- Loading states & Streaming
- Route Handlers
- TypeScript patterns
- Performance optimization

**Reference:** `/frameworks/nextjs.mdc`

## Planned Frameworks

### 🔜 React (`react.mdc`)
**Status:** Planned

Will include:
- React-specific component patterns
- Hooks best practices
- State management patterns (Context, Redux, Zustand)
- TypeScript conventions
- Testing strategies
- Performance optimizations
- Component composition patterns


## Adding New Frameworks

When adding a new framework:

1. **Create Framework File**
   ```bash
   touch frameworks/[framework-name].mdc
   ```

2. **Follow Template Structure**
   ```markdown
   # [Framework Name] - Best Practices & Patterns
   
   ## Philosophy & Core Principles
   ## Project Detection
   ## Component Patterns
   ## File Structure
   ## Best Practices
   ## Testing Patterns
   ## Code Examples
   ```

3. **Update This README**
   - Move from "Planned" to "Current"
   - Update status and features

4. **Reference in Main Rules**
   - Update `spark.mdc` to reference new framework
   - Add framework-specific naming conventions
   - Update component rules as needed

## Universal Patterns

For patterns that apply across all frameworks, use:
- `/core/patterns.mdc` - Universal patterns and templates
- `/core/accessibility.mdc` - Accessibility standards
- `/core/testing.mdc` - Testing strategies

Framework-specific files should only contain patterns unique to that framework.

## Documentation Standards

Each framework file should include:

### Required Sections
- **Philosophy** - Framework's approach and principles
- **Detection** - How to detect the framework in projects
- **Component Patterns** - Framework-specific component structures
- **File Structure** - Directory and file conventions
- **Best Practices** - Framework-specific best practices
- **Testing** - Framework-specific testing patterns
- **Examples** - Code examples and use cases

### Optional Sections
- **Integration** - Third-party library integration
- **Performance** - Framework-specific optimizations
- **Migration** - Upgrading from older versions
- **Advanced** - Complex patterns and edge cases

---

**Last Updated:** October 3, 2025
**Maintained By:** Spark Team

