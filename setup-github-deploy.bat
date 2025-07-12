@echo off
:: Risk Sense AI - GitHub Setup and Digital Ocean Deployment Script (Windows)
:: This script sets up GitHub repository and prepares for Digital Ocean deployment

echo === Risk Sense AI - GitHub Setup and Digital Ocean Deployment ===
echo.

:: Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git is not installed. Please install Git first.
    pause
    exit /b 1
)

:: Check if npm is installed
npm --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Node.js/npm is not installed. Please install Node.js first.
    pause
    exit /b 1
)

echo [INFO] Starting Risk Sense AI deployment setup...

:: Step 1: Install dependencies and generate package-lock.json
echo [INFO] Installing dependencies...
npm install

if errorlevel 1 (
    echo [ERROR] npm install failed. Please check your internet connection.
    pause
    exit /b 1
)

:: Step 2: Initialize git repository
echo [INFO] Initializing Git repository...
git init

:: Step 3: Add all files
echo [INFO] Adding files to Git...
git add .

:: Step 4: Create initial commit
echo [INFO] Creating initial commit...
git commit -m "Initial commit: Risk Sense AI - Smart Investment Analysis Platform"

:: Step 5: Get GitHub repository URL
echo.
echo === GitHub Repository Setup ===
echo.
echo Please provide your GitHub repository information:
set /p github_username=Enter your GitHub username: 
set /p repo_name=Enter your repository name (default: risk-sense-ai): 

:: Default repository name
if "%repo_name%"=="" set repo_name=risk-sense-ai

:: Construct repository URL
set repo_url=https://github.com/%github_username%/%repo_name%.git

echo [INFO] Repository URL: %repo_url%

:: Step 6: Add remote origin
echo [INFO] Adding GitHub remote...
git remote add origin %repo_url%

:: Step 7: Set main branch
echo [INFO] Setting main branch...
git branch -M main

:: Step 8: Attempt to push
echo [INFO] Pushing to GitHub...
echo.
echo [WARNING] You may need to authenticate with GitHub.
echo [WARNING] Use your GitHub username and Personal Access Token (not password).
echo [WARNING] Get your token from: https://github.com/settings/tokens
echo.

git push -u origin main

if errorlevel 1 (
    echo [ERROR] Failed to push to GitHub. Please check:
    echo 1. Repository exists on GitHub
    echo 2. You have the correct permissions
    echo 3. Your authentication is correct
    echo.
    echo You can try pushing manually:
    echo git push -u origin main
    echo.
) else (
    echo [INFO] Successfully pushed to GitHub!
    echo.
    echo Repository URL: https://github.com/%github_username%/%repo_name%
    echo.
)

:: Step 9: Digital Ocean deployment instructions
echo.
echo === Digital Ocean Deployment Instructions ===
echo.
echo [INFO] Your repository is now ready for Digital Ocean deployment!
echo.
echo Next steps:
echo 1. Go to Digital Ocean Dashboard
echo 2. Click 'Create' → 'Apps'
echo 3. Connect your GitHub repository: https://github.com/%github_username%/%repo_name%
echo 4. Configure build settings:
echo    - Build Command: npm run build
echo    - Run Command: npm start
echo    - Environment: Node.js
echo    - Port: 5000
echo 5. Add environment variables:
echo    - NODE_ENV=production
echo    - PORT=5000
echo    - NEWS_API_KEY=your_news_api_key
echo    - OPENROUTER_API_KEY=your_openrouter_api_key
echo 6. Click 'Create Resources'
echo.
echo [INFO] Your app will be available at: https://your-app-name.ondigitalocean.app
echo.

:: Step 10: Alternative deployment options
echo === Alternative Deployment Options ===
echo.
echo Option 1: Digital Ocean Droplet with Docker
echo    - See DIGITAL_OCEAN_SETUP.md for detailed instructions
echo    - Cost: $6/month minimum
echo    - More control and flexibility
echo.
echo Option 2: Digital Ocean Kubernetes
echo    - See DIGITAL_OCEAN_SETUP.md for detailed instructions
echo    - Cost: $12/month minimum
echo    - Best for high-traffic applications
echo.

:: Step 11: API Keys reminder
echo === API Keys Required ===
echo.
echo [WARNING] Don't forget to obtain your API keys:
echo 1. News API: https://newsapi.org/ (Free tier: 500 requests/day)
echo 2. OpenRouter: https://openrouter.ai/ (Pay-per-use: ~$0.001/request)
echo.
echo Add these keys to your Digital Ocean App environment variables.
echo.

:: Step 12: Documentation
echo === Documentation ===
echo.
echo [INFO] Complete documentation is available:
echo - README.md - Project overview and quick start
echo - USER_MANUAL.md - Complete user guide
echo - TECHNICAL_SPECIFICATIONS.md - Technical architecture
echo - DEPLOYMENT_GUIDE.md - Hosting instructions
echo - DIGITAL_OCEAN_SETUP.md - Digital Ocean specific setup
echo.

echo [INFO] Setup complete! Your Risk Sense AI application is ready for deployment.
echo.
echo Repository: https://github.com/%github_username%/%repo_name%
echo Next: Deploy to Digital Ocean using the instructions above.
echo.

pause