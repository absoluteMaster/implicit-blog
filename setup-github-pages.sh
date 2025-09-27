#!/bin/bash

echo "🚀 Setting up Implicit Blog on GitHub Pages"
echo "============================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_step() { echo -e "${BLUE}📋 $1${NC}"; }
print_success() { echo -e "${GREEN}✅ $1${NC}"; }
print_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
print_error() { echo -e "${RED}❌ $1${NC}"; }

# Your GitHub details
GITHUB_USERNAME="absoluteMaster"
GITHUB_EMAIL="thebossalgorithm@gmail.com"

print_success "Using GitHub account: $GITHUB_USERNAME ($GITHUB_EMAIL)"

# Check if git is initialized (we already did this)
if [ -d ".git" ]; then
    print_success "Git repository already initialized"
else
    print_step "Initializing git repository..."
    git init
    git branch -M main
    print_success "Git repository initialized"
fi

# Step 1: Create .gitignore
print_step "Creating .gitignore file..."
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
.pnp
.pnp.js

# Production
.quartz-cache/
public/

# Environment variables
.env*

# Logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor directories and files
.vscode/
.idea/
*.swp
*.swo
*~

# Temporary files
*.tmp
*.temp

# Keep only the symlinked content, not the full Obsidian vault
ObsidianVault/Personal/
ObsidianVault/Work/
ObsidianVault/Ideas/
ObsidianVault/Knowledge/
EOF
print_success ".gitignore created"

# Step 2: Create CNAME file for custom domain
print_step "Creating CNAME file for implicit.ink domain..."
echo "implicit.ink" > CNAME
print_success "CNAME file created"

# Step 3: Update Quartz config for custom domain
print_step "Updating Quartz configuration for implicit.ink..."
if [ -f "quartz/quartz.config.ts" ]; then
    cp quartz/quartz.config.ts quartz/quartz.config.ts.backup
    sed -i 's|baseUrl: "[^"]*"|baseUrl: "implicit.ink"|g' quartz/quartz.config.ts
    print_success "Quartz baseUrl updated to implicit.ink"
else
    print_warning "quartz.config.ts not found - will need manual update"
fi

# Step 4: Create GitHub Actions workflow
print_step "Creating GitHub Actions deployment workflow..."
mkdir -p .github/workflows

cat > .github/workflows/deploy.yml << 'EOF'
name: Deploy Quartz site to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - uses: actions/setup-node@v4
        with:
          node-version: 18.14

      - name: Install Dependencies
        run: npm ci

      - name: Build Quartz
        run: npx quartz build

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: public

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-22.04
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
EOF
print_success "GitHub Actions workflow created"

# Step 5: Commit all changes
print_step "Committing all files to git..."
git add .
git commit -m "Initial commit: Implicit blog setup for GitHub Pages

🚀 Generated with Claude Code
https://claude.ai/code

Co-Authored-By: Claude <noreply@anthropic.com>"
print_success "Files committed to git"

echo ""
echo "🎯 MANUAL STEPS REQUIRED:"
echo "========================="
echo ""

print_step "1. GITHUB AUTHENTICATION"
echo "   Go to: https://github.com/settings/tokens"
echo "   → Generate new token (classic)"
echo "   → Select 'repo' permissions"
echo "   → Copy the token (you'll use it as password)"
echo ""

print_step "2. CREATE GITHUB REPOSITORY"
echo "   Go to: https://github.com/new"
echo "   → Repository name: implicit-blog"
echo "   → Description: Implicit blog powered by Quartz and Obsidian"
echo "   → Make it PUBLIC"
echo "   → DON'T initialize with README/gitignore/license"
echo "   → Click 'Create repository'"
echo ""

print_step "3. CONNECT & PUSH TO GITHUB"
echo "   Run these commands:"
echo "   git remote add origin https://github.com/$GITHUB_USERNAME/implicit-blog.git"
echo "   git push -u origin main"
echo "   (When prompted for password, use your Personal Access Token)"
echo ""

print_step "4. ENABLE GITHUB PAGES"
echo "   In your repo → Settings → Pages:"
echo "   → Source: 'GitHub Actions'"
echo "   → Custom domain: 'implicit.ink'"
echo "   → Save"
echo ""

print_step "5. CONFIGURE DNS"
echo "   At your domain registrar, add these A records for implicit.ink:"
echo "   185.199.108.153"
echo "   185.199.109.153"
echo "   185.199.110.153"
echo "   185.199.111.153"
echo ""

print_success "Setup complete! Your blog will be live at https://implicit.ink"
echo ""
echo "📝 What this script did:"
echo "   ✅ Configured git repository"
echo "   ✅ Created .gitignore for Quartz"
echo "   ✅ Added CNAME for implicit.ink"
echo "   ✅ Updated Quartz config"
echo "   ✅ Created GitHub Actions workflow"
echo "   ✅ Committed everything to git"
echo ""
echo "🔄 After completing manual steps, your workflow will automatically:"
echo "   → Build your site when you push changes"
echo "   → Deploy to GitHub Pages"
echo "   → Serve at https://implicit.ink"