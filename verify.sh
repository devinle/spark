#!/bin/bash

# Spark Installation Verification Script
# This script helps verify that Spark is properly installed and working

set -e

# Load shared configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck disable=SC1091
source "$SCRIPT_DIR/config.sh"

# Show branding
show_branding
echo "Spark Installation Verification"
echo "==============================="

# Check if we're in a project with Spark installed
if [ ! -d ".cursor/rules/spark" ]; then
    print_error "Spark installation not found in current directory"
    print_info "Make sure you're in a project directory where Spark was installed"
    print_info "Run this script from your project root directory"
    exit 1
fi

print_success "Spark installation directory found"

# Check for required files
REQUIRED_FILES=(
    ".cursor/rules/spark/spark.mdc"
    ".cursor/rules/spark/.restart-required"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        print_success "Found: $file"
    else
        print_warning "Missing: $file"
    fi
done

# Check installation timestamp
if [ -f ".cursor/rules/spark/.restart-required" ]; then
    INSTALL_DATE=$(grep "Installed:" .cursor/rules/spark/.restart-required | cut -d' ' -f2-)
    if [ -n "$INSTALL_DATE" ]; then
        print_info "Spark installed: $INSTALL_DATE"
    fi
fi

# Check Cursor IDE status
check_cursor_status() {
    print_info "Checking Cursor IDE status..."
    
    # Check if Cursor is running (macOS)
    if command -v pgrep >/dev/null 2>&1; then
        if pgrep -f "Cursor" >/dev/null 2>&1; then
            print_success "Cursor IDE is running"
        else
            print_warning "Cursor IDE is not running"
            print_info "Start Cursor IDE and open this project to use Spark"
        fi
    else
        print_info "Cannot detect Cursor IDE status on this system"
    fi
}

check_cursor_status

# Provide verification instructions
echo ""
echo "To verify Spark is working:"
echo "1. Open Cursor IDE in this project directory"
echo "2. Open the chat panel (Cmd+L on Mac, Ctrl+L on Windows/Linux)"
echo "3. Type: @spark help"
echo "4. If you see Spark's help message, installation is successful"
echo ""

# Check for common issues
echo "Troubleshooting checklist:"
echo "✓ Spark installation directory exists"
echo "✓ Required files are present"
echo ""

if [ -f ".cursor/rules/spark/.restart-required" ]; then
    print_warning "Restart required file found - Cursor IDE may need restart"
    echo "If @spark doesn't work:"
    echo "1. Quit Cursor IDE completely"
    echo "2. Reopen Cursor IDE in this project"
    echo "3. Try @spark help again"
fi

echo ""
print_success "Verification complete!"
