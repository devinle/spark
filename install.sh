#!/bin/bash

set -e  # Exit on any error

# Load shared configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=config.sh
source "$SCRIPT_DIR/config.sh"

# Show branding
show_branding
echo "Spark - Your Friendly Component Generator"
echo "=========================================="

# Determine source and target directories
if [ -f "install.sh" ] && [ -d ".cursor" ]; then
    # We're in the spark repository - this is not the intended use case
    print_error "This script should not be run from within the spark repository"
    print_info "To install Spark in your project:"
    print_info "1. Navigate to your project directory"
    print_info "2. Run: path/to/spark/install.sh"
    print_info "3. Or copy install.sh to your project and run it"
    exit 1
elif [ -d "$SCRIPT_DIR/.cursor/rules/spark" ]; then
    # We're in a target project, install to current directory
    TARGET_DIR="$(pwd)"
    print_info "Installing from spark repository to target project: $TARGET_DIR"
else
    print_error "Spark repository not found"
    print_info "Make sure this script is in the spark repository directory"
    print_info "Try: git clone $REPO_GIT_URL"
    exit 1
fi

# Project detection
detect_project_type() {
    if [ -f "package.json" ]; then
        if grep -q "next" package.json 2>/dev/null; then
            echo "next"
        elif grep -q "react" package.json 2>/dev/null; then
            echo "react"
        else
            echo "javascript"
        fi
    elif [ -f "composer.json" ] || [ -f "wp-config.php" ] || [ -d "wp-content" ]; then
        echo "wordpress"
    elif [ -f "index.html" ] || ls *.html >/dev/null 2>&1; then
        echo "html"
    else
        echo "unknown"
    fi
}

PROJECT_TYPE=$(detect_project_type)

case $PROJECT_TYPE in
    "next"|"react"|"javascript")
        print_success "Detected JavaScript/React project"
        ;;
    "wordpress")
        print_success "Detected WordPress project"
        ;;
    "html")
        print_success "Detected HTML project"
        ;;
    "unknown")
        print_warning "Project type not detected"
        echo "Spark works with any project type. Continue? (y/n)"
        read -r response
        if [ "$response" != "y" ] && [ "$response" != "Y" ]; then
            print_info "Installation cancelled"
            exit 0
        fi
        ;;
esac

# Check for Cursor IDE
check_cursor() {
    if [ ! -d ".cursor" ] && [ ! -f ".cursorrules" ]; then
        print_warning "No Cursor configuration detected"
        print_info "Spark is designed for Cursor IDE but will work with other editors"
        echo "Continue installation? (y/n)"
        read -r response
        if [ "$response" != "y" ] && [ "$response" != "Y" ]; then
            print_info "Installation cancelled"
            exit 0
        fi
    fi
}

check_cursor

# Create .cursor/rules directory in target project
print_info "Creating .cursor/rules directory structure in target project..."
mkdir -p "$TARGET_DIR/.cursor/rules"

# Backup existing installation
if [ -d "$TARGET_DIR/.cursor/rules/spark" ]; then
    BACKUP_DIR="$TARGET_DIR/.cursor/rules/spark.backup.$(date +%Y%m%d_%H%M%S)"
    print_warning "Existing Spark installation found"
    print_info "Creating backup at: $BACKUP_DIR"
    cp -r "$TARGET_DIR/.cursor/rules/spark" "$BACKUP_DIR"
    print_success "Backup created"
fi

# Copy Spark files
print_info "Installing Spark rules..."
if [ ! -d "$SCRIPT_DIR/.cursor/rules/spark" ]; then
    print_error "Spark rules directory not found in repository"
    exit 1
fi

cp -r "$SCRIPT_DIR/.cursor/rules/spark" "$TARGET_DIR/.cursor/rules/"
print_success "Spark rules installed"

# Set proper permissions
find "$TARGET_DIR/.cursor/rules/spark" -type f -exec chmod 644 {} \;
find "$TARGET_DIR/.cursor/rules/spark" -type d -exec chmod 755 {} \;
print_success "Permissions set"

# Verify installation
if [ -f "$TARGET_DIR/.cursor/rules/spark/spark.mdc" ]; then
    print_success "Installation verified"
else
    print_error "Installation verification failed"
    exit 1
fi

# Installation complete
echo ""
echo -e "${GREEN}🔥 Spark installed successfully!${NC}"
echo ""
echo "Quick start:"
echo "1. Open your project in Cursor IDE"
echo "2. Open chat and type: @spark"
echo "3. Follow the prompts to create your first component"
echo ""
echo "Available components:"
echo "• accordion - Collapsible sections for FAQs and content organization"
echo "• card - Content containers for products, blog posts, team profiles"
echo "• carousel - Image sliders for galleries, testimonials, hero banners"
echo "• dialog - Modals and popups for confirmations, lightboxes, forms"
echo ""
echo "Example usage:"
echo "• @spark accordion - Interactive accordion creation"
echo "• @spark faq - Quick FAQ accordion"
echo "• @spark product-card - Product display card"
echo "• @spark help - Show all available options"
echo ""
print_info "Need help? Check the README.md in .cursor/rules/spark/"

# Optional: Check for updates
echo ""
echo "Want to check for updates automatically? (y/n)"
read -r response
if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
    # Create update reminder
    cat > "$TARGET_DIR/.cursor/rules/spark/.update-check" << EOF
# Spark Update Reminder
# Last installed: $(date)
# Repository: $REPO_URL
# Target project: $TARGET_DIR
# 
# To update: 
# cd path/to/spark && git pull && ./install.sh
EOF
    print_success "Update reminder created"
fi

echo ""
print_success "Ready to build amazing components with Spark!"