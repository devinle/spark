#!/bin/bash

set -e  # Exit on any error

# Load shared configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./config.sh
source "$SCRIPT_DIR/config.sh"

# Show branding
show_branding
echo "Spark Update Manager"
echo "==================="

# Check if git is available
if ! command -v git &> /dev/null; then
    print_error "Git is required but not installed"
    exit 1
fi

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    print_error "This script must be run from the spark git repository"
    print_info "Try: git clone $REPO_GIT_URL"
    exit 1
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD -- 2>/dev/null; then
    print_warning "You have uncommitted changes in this repository"
    echo "Continue with update? This might overwrite local changes (y/n)"
    read -r response
    if [ "$response" != "y" ] && [ "$response" != "Y" ]; then
        print_info "Update cancelled"
        exit 0
    fi
fi

# Get current version info
CURRENT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")

print_info "Current version: $CURRENT_COMMIT on branch $CURRENT_BRANCH"

# Fetch latest changes
print_info "Fetching latest changes..."
if ! git fetch origin; then
    print_error "Failed to fetch updates from remote repository"
    print_info "Check your internet connection and repository access"
    exit 1
fi

# Check if updates are available
if git diff-index --quiet HEAD "origin/$CURRENT_BRANCH" 2>/dev/null; then
    print_success "Already up to date!"
    echo ""
    echo "Current installation is using the latest version."
    exit 0
fi

# Show what will be updated
echo ""
print_info "Updates available:"
echo ""
git log --oneline --graph "HEAD..origin/$CURRENT_BRANCH" | head -10
if [ "$(git rev-list --count "HEAD..origin/$CURRENT_BRANCH")" -gt 10 ]; then
    echo "... and $(( $(git rev-list --count "HEAD..origin/$CURRENT_BRANCH") - 10 )) more commits"
fi

echo ""
echo "Proceed with update? (y/n)"
read -r response
if [ "$response" != "y" ] && [ "$response" != "Y" ]; then
    print_info "Update cancelled"
    exit 0
fi

# Pull latest changes
print_info "Updating repository..."
if ! git pull origin "$CURRENT_BRANCH"; then
    print_error "Failed to pull updates"
    print_info "You may need to resolve conflicts or check repository access"
    exit 1
fi

NEW_COMMIT=$(git rev-parse --short HEAD)
print_success "Updated to version: $NEW_COMMIT"

# Check if install script exists
if [ ! -f "install.sh" ]; then
    print_error "install.sh not found in updated repository"
    exit 1
fi

# Make install script executable
chmod +x install.sh

# Run installation
print_info "Applying updates to your project..."
echo ""

if ! ./install.sh; then
    print_error "Update installation failed"
    print_info "Your repository was updated but the installation to your project failed"
    exit 1
fi

echo ""
print_success "Update completed successfully!"
echo ""
echo "Changelog (last 5 commits):"
git log --oneline --graph -5
echo ""
print_info "Your Spark installation is now up to date"
print_info "Restart Cursor IDE to ensure all changes are loaded"

# Update the version tracking file if it exists
if [ -f ".cursor/rules/spark/.update-check" ]; then
    cat > .cursor/rules/spark/.update-check << EOF
# Spark Update Reminder
# Last updated: $(date)
# Version: $NEW_COMMIT
# Repository: $REPO_URL
# 
# To update: 
# cd path/to/spark && ./update.sh
EOF
fi