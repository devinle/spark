#!/bin/bash

# Spark Configuration
# This file contains shared configuration variables for Spark scripts

# Repository URLs
REPO_URL="https://github.com/devinle/spark"
REPO_GIT_URL="https://github.com/devinle/spark.git"

# Project metadata
PROJECT_NAME="spark"
PROJECT_DESCRIPTION="A conversational component generation system for Cursor IDE"

# Version info (can be updated during releases)
VERSION="1.1.0"

# Colors for output (shared across scripts)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Common functions
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }
print_info() { echo -e "${BLUE}ℹ${NC} $1"; }

# Spark branding
show_branding() {
    echo -e "${BLUE}"
    echo "  ┌─┐┌─┐┌─┐┬─┐┬┌─"
    echo "  └─┐├─┘├─┤├┬┘├┴┐"
    echo "  └─┘┴  ┴ ┴┴└─┴ ┴"
    echo -e "${NC}"
}
