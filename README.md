<img src="assets/spark.svg" alt="Spark Logo" width="360">

# spark

A conversational component generation system for Cursor IDE that creates production-ready UI components through natural language interaction.

**Built by Fueled** | **Designed for Teams** | **Production-Ready Components**

## Quick Start

### Installation

```bash
git clone https://github.com/devinle/spark.git
cd spark
chmod +x install.sh
./install.sh
```

### Non-Interactive Installation

For automated environments (CI/CD, scripts), use the non-interactive mode:

```bash
# From your project directory
/path/to/spark/install.sh --non-interactive

# Or set environment variable
NON_INTERACTIVE=true /path/to/spark/install.sh
```

The installation script will:
- Detect your project type (React, WordPress, HTML, etc.)
- Create the necessary `.cursor/rules` directory structure
- Install Spark rules for Cursor IDE
- Set up proper permissions

### Usage

**⚠️ IMPORTANT: After installation, you must restart Cursor IDE for Spark to work!**

## Cursor IDE Restart Required

Spark works by installing rules in your project's `.cursor/rules/spark/` directory. Cursor IDE loads these rules when it starts up, so **a restart is required** after installation for Spark to become available.

### Step-by-Step Restart Process

#### 1. Save Your Work
Before restarting, make sure to save any open files in Cursor IDE:
- **Mac**: Cmd+S to save current file, or Cmd+Option+S to save all
- **Windows/Linux**: Ctrl+S to save current file, or Ctrl+K+S to save all

#### 2. Quit Cursor IDE Completely
**Important**: Don't just close the window - quit the application completely:

- **Mac**: 
  - Press `Cmd+Q` to quit
  - Or go to Cursor menu → Quit Cursor
  - Or right-click Cursor in dock → Quit

- **Windows**: 
  - Press `Alt+F4` to close the window
  - Or click the X button in the top-right corner
  - Or right-click Cursor in taskbar → Close window

- **Linux**: 
  - Press `Alt+F4` to close the window
  - Or click the X button in the top-right corner
  - Or right-click Cursor in dock/taskbar → Quit

#### 3. Reopen Cursor IDE
- Open Cursor IDE again
- Open your project (the one where you installed Spark)
- Wait for Cursor to fully load

#### 4. Verify Spark is Working
1. Open the chat panel:
   - **Mac**: `Cmd+L`
   - **Windows/Linux**: `Ctrl+L`

2. Type `@spark help` and press Enter

3. If you see Spark's help message, installation was successful!

### Quick Start After Restart

Once Cursor IDE is restarted, you can start using Spark:

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
- **Context7 Integration** - Automatically enhanced with latest framework documentation and best practices when available

## Features

- **Conversational Interface**: Natural language interaction with Cursor IDE
- **Basic Project Detection**: Detects React, WordPress, HTML, and other project types
- **Accessibility First**: WCAG 2.2 AA compliant components
- **Multiple Frameworks**: Works with React, WordPress, and vanilla HTML/CSS/JS
- **Production Ready**: Optimized code with best practices built-in
- **Context7 Integration**: Seamlessly enhanced with latest framework documentation and best practices when available

## Installation Requirements

- **Cursor IDE** (required) - Spark integrates with Cursor's Chat Agent interface
- **Git** - For installation and updates
- **Node.js 16+** (for React/TypeScript components)
- **PHP 7.4+** (for WordPress components)

### Important: How Spark Works with Cursor IDE

Spark is **not** a command-line tool. It works exclusively through Cursor IDE's chat interface:

- **`@spark`** - Chat trigger within Cursor IDE (not a CLI command)
- **`@cursor`** - Separate CLI tool to launch Cursor IDE (not related to Spark)
- **No terminal commands** - All interaction happens in Cursor's chat panel

Works with any project type:
- Next.js / React applications
- WordPress themes and plugins
- Static HTML sites
- Node.js projects
- Monorepos

## Available Components

Spark generates four core UI components:

### Accordion
Collapsible sections perfect for FAQs, product details, and step-by-step guides
- Accessible keyboard navigation
- Smooth animations
- Multiple open/close patterns

### Card
Content containers for products, blog posts, team profiles, and media displays
- Responsive layouts
- Image optimization
- Action button support

### Carousel
Image sliders for galleries, testimonials, hero banners, and content rotation
- Touch/swipe support
- Auto-play options
- Navigation controls

### Dialog
Modals and popups for confirmations, lightboxes, contact forms, and alerts
- Focus management
- Escape key handling
- Backdrop interactions

## How It Works

Spark integrates with Cursor IDE through a simple rule system that:

- Detects your project type automatically
- Provides conversational component generation
- Supports multiple technology stacks
- Follows accessibility best practices
- Generates production-ready code
- **Context7 Integration**: Automatically enhances components with latest framework documentation and best practices when available

### Context7 Integration

Spark seamlessly integrates with the Context7 MCP server to provide enhanced component generation:

- **Automatic Detection**: Silently checks for Context7 availability before generating components
- **Framework-Specific Enhancement**: Uses latest documentation for React, Vue, Angular, and other frameworks
- **Library Integration**: Leverages current best practices for Material-UI, Chakra UI, Tailwind, and more
- **Frictionless Experience**: Works perfectly even when Context7 is unavailable - no interruption to your workflow
- **Natural Enhancement**: Presents improvements as "latest patterns" without mentioning Context7 directly

**What This Means for You:**
- Components are always generated with the most current patterns and best practices
- Framework-specific optimizations are automatically applied
- Library integrations follow the latest conventions
- No additional setup or configuration required
- Works seamlessly whether Context7 is available or not

### Cursor IDE Integration Details

Spark works by installing rules in your project's `.cursor/rules/spark/` directory. When you:

1. **Open Cursor IDE** in your project
2. **Open the Chat panel** (Cmd+L on Mac, Ctrl+L on Windows/Linux)
3. **Type `@spark`** followed by a component name
4. **Spark responds** with conversational component generation

**Key Points:**
- Spark is **not** a command-line tool - it only works in Cursor's chat interface
- The `@spark` trigger is **not** the same as `@cursor` CLI commands
- All component generation happens through natural language conversation
- No terminal or command-line interaction required

## Project Detection

Spark automatically detects your project type and adapts accordingly:

- **React/Next.js**: Generates TypeScript components with modern patterns
- **WordPress**: Creates PHP components following WordPress standards
- **HTML/CSS**: Produces vanilla JavaScript with accessibility features
- **Unknown**: Works with any project type using best practices

## Updates

Keep Spark current with the latest patterns and improvements:

```bash
# From the spark repository
./update.sh

# Check for updates manually
git pull origin main && ./install.sh

# Verify installation after updates
./verify.sh
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

### Community
- [GitHub Issues](https://github.com/devinle/spark/issues) - Report bugs, request features
- [GitHub Discussions](https://github.com/devinle/spark/discussions) - Ask questions, share tips

### Troubleshooting

**Spark not responding in Cursor?**
1. **First step: Restart Cursor IDE completely** (quit and reopen)
2. Verify installation: `ls .cursor/rules/spark/`
3. Check that you're in a project directory with the rules installed
4. Make sure you're using `@spark` in Cursor's chat panel, not the terminal
5. Run verification script: `./verify.sh` (from your project directory)

**`@spark` not working in chat?**
1. Ensure you're typing `@spark` (not `@cursor`)
2. Check that Cursor IDE is up to date
3. Verify the chat panel is open (Cmd+L / Ctrl+L)
4. Try typing just `@spark` first, then add component names

**Installation issues?**
1. Ensure you have Git installed
2. Check project permissions
3. Try running `./install.sh` again
4. Make sure you're running the script from the spark repository

**Need to reset installation?**
```bash
rm -rf .cursor/rules/spark
cd path/to/spark && ./install.sh
```

**Common Misconceptions:**
- ❌ Spark is **not** a command-line tool
- ❌ `@spark` is **not** a terminal command
- ❌ You **cannot** run Spark from the terminal
- ✅ Spark only works in Cursor IDE's chat interface
- ✅ Use `@spark` in Cursor's chat panel, not the terminal

### Advanced Troubleshooting

**Spark Still Not Working After Restart?**

1. **Check Installation**:
   ```bash
   ls .cursor/rules/spark/
   ```
   You should see files like `spark.mdc` and `.restart-required`

2. **Run Verification Script**:
   ```bash
   ./verify.sh
   ```
   This will check your installation and provide specific guidance

3. **Try Another Restart**:
   Sometimes Cursor needs a second restart to pick up new rules

4. **Check Cursor IDE Version**:
   Make sure you're using a recent version of Cursor IDE

5. **Verify Project Directory**:
   Make sure you're in the correct project directory where Spark was installed

**Common Issues**

**"@spark not found" in chat**
- This means Cursor hasn't loaded the rules yet
- Try restarting Cursor IDE again
- Make sure you're in the project directory where Spark was installed

**"@spark" works but shows no response**
- Check that you're typing `@spark` (not `@cursor`)
- Make sure the chat panel is open (Cmd+L / Ctrl+L)
- Try typing just `@spark` first, then add component names

**Installation verification fails**
- Run `./verify.sh` to diagnose the issue
- Check file permissions in `.cursor/rules/spark/`
- Try reinstalling Spark

**Alternative: Manual Rule Reload**

If you can't restart Cursor IDE right now, you can try:
1. Close all Cursor IDE windows
2. Wait 5-10 seconds
3. Reopen Cursor IDE

This sometimes works as a "soft restart" for rule loading.

**Still Having Issues?**

If Spark still isn't working after following this guide:
1. **Check the troubleshooting section** above
2. **Run the verification script**: `./verify.sh`
3. **Open an issue** on GitHub with:
   - Your operating system
   - Cursor IDE version
   - Output from `./verify.sh`
   - Any error messages you see

### Quick Reference

| Action | Mac | Windows/Linux |
|--------|-----|---------------|
| Save file | Cmd+S | Ctrl+S |
| Save all | Cmd+Option+S | Ctrl+K+S |
| Quit Cursor | Cmd+Q | Alt+F4 |
| Open chat | Cmd+L | Ctrl+L |
| Test Spark | Type `@spark help` | Type `@spark help` |

**Remember**: Spark only works in Cursor IDE's chat interface, not in the terminal or command line!

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

Spark is developed by [Fueled](https://fueled.com), a digital product agency focused on creating exceptional user experiences. We build internal tools that make our team more productive, and we're excited to share them with the broader development community.

---

**Ready to build amazing components?**

```bash
git clone https://github.com/devinle/spark.git
cd spark
chmod +x install.sh
./install.sh
```

Then open Cursor and type `@spark` to get started!