#!/bin/bash

# Risk Sense AI - GitHub Setup and Digital Ocean Deployment Script
# This script sets up GitHub repository and prepares for Digital Ocean deployment

echo "=== Risk Sense AI - GitHub Setup and Digital Ocean Deployment ==="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    print_error "Node.js/npm is not installed. Please install Node.js first."
    exit 1
fi

print_status "Starting Risk Sense AI deployment setup..."

# Step 1: Install dependencies and generate package-lock.json
print_status "Installing dependencies..."
npm install

if [ $? -ne 0 ]; then
    print_error "npm install failed. Please check your internet connection."
    exit 1
fi

# Step 2: Initialize git repository
print_status "Initializing Git repository..."
git init

# Step 3: Add all files
print_status "Adding files to Git..."
git add .

# Step 4: Create initial commit
print_status "Creating initial commit..."
git commit -m "Initial commit: Risk Sense AI - Smart Investment Analysis Platform

- Complete React + TypeScript frontend
- Express.js backend with AI integration
- Mistral AI via OpenRouter for analysis
- World Bank API, News API, CDP data integration
- Digital Ocean deployment ready
- Complete documentation suite
- Docker and docker-compose configuration"

# Step 5: Get GitHub repository URL
echo ""
echo "=== GitHub Repository Setup ==="
echo ""
echo "Please provide your GitHub repository information:"
read -p "Enter your GitHub username: " github_username
read -p "Enter your repository name (default: risk-sense-ai): " repo_name

# Default repository name
if [ -z "$repo_name" ]; then
    repo_name="risk-sense-ai"
fi

# Construct repository URL
repo_url="https://github.com/$github_username/$repo_name.git"

print_status "Repository URL: $repo_url"

# Step 6: Add remote origin
print_status "Adding GitHub remote..."
git remote add origin $repo_url

# Step 7: Set main branch
print_status "Setting main branch..."
git branch -M main

# Step 8: Attempt to push
print_status "Pushing to GitHub..."
echo ""
print_warning "You may need to authenticate with GitHub."
print_warning "Use your GitHub username and Personal Access Token (not password)."
print_warning "Get your token from: https://github.com/settings/tokens"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    print_status "Successfully pushed to GitHub!"
    echo ""
    echo "Repository URL: https://github.com/$github_username/$repo_name"
    echo ""
else
    print_error "Failed to push to GitHub. Please check:"
    echo "1. Repository exists on GitHub"
    echo "2. You have the correct permissions"
    echo "3. Your authentication is correct"
    echo ""
    echo "You can try pushing manually:"
    echo "git push -u origin main"
    echo ""
fi

# Step 9: Digital Ocean deployment instructions
echo ""
echo "=== Digital Ocean Deployment Instructions ==="
echo ""
print_status "Your repository is now ready for Digital Ocean deployment!"
echo ""
echo "Next steps:"
echo "1. Go to Digital Ocean Dashboard"
echo "2. Click 'Create' → 'Apps'"
echo "3. Connect your GitHub repository: https://github.com/$github_username/$repo_name"
echo "4. Configure build settings:"
echo "   - Build Command: npm run build"
echo "   - Run Command: npm start"
echo "   - Environment: Node.js"
echo "   - Port: 5000"
echo "5. Add environment variables:"
echo "   - NODE_ENV=production"
echo "   - PORT=5000"
echo "   - NEWS_API_KEY=your_news_api_key"
echo "   - OPENROUTER_API_KEY=your_openrouter_api_key"
echo "6. Click 'Create Resources'"
echo ""
print_status "Your app will be available at: https://your-app-name.ondigitalocean.app"
echo ""

# Step 10: Alternative deployment options
echo "=== Alternative Deployment Options ==="
echo ""
echo "Option 1: Digital Ocean Droplet with Docker"
echo "   - See DIGITAL_OCEAN_SETUP.md for detailed instructions"
echo "   - Cost: \$6/month minimum"
echo "   - More control and flexibility"
echo ""
echo "Option 2: Digital Ocean Kubernetes"
echo "   - See DIGITAL_OCEAN_SETUP.md for detailed instructions"
echo "   - Cost: \$12/month minimum"
echo "   - Best for high-traffic applications"
echo ""

# Step 11: API Keys reminder
echo "=== API Keys Required ==="
echo ""
print_warning "Don't forget to obtain your API keys:"
echo "1. News API: https://newsapi.org/ (Free tier: 500 requests/day)"
echo "2. OpenRouter: https://openrouter.ai/ (Pay-per-use: ~\$0.001/request)"
echo ""
echo "Add these keys to your Digital Ocean App environment variables."
echo ""

# Step 12: Documentation
echo "=== Documentation ==="
echo ""
print_status "Complete documentation is available:"
echo "- README.md - Project overview and quick start"
echo "- USER_MANUAL.md - Complete user guide"
echo "- TECHNICAL_SPECIFICATIONS.md - Technical architecture"
echo "- DEPLOYMENT_GUIDE.md - Hosting instructions"
echo "- DIGITAL_OCEAN_SETUP.md - Digital Ocean specific setup"
echo ""

print_status "Setup complete! Your Risk Sense AI application is ready for deployment."
echo ""
echo "Repository: https://github.com/$github_username/$repo_name"
echo "Next: Deploy to Digital Ocean using the instructions above."
echo ""