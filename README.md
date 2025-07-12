# Risk Sense AI - Smart Investment Analysis

![Risk Sense AI](https://img.shields.io/badge/AI-Powered-blue) ![React](https://img.shields.io/badge/React-18-blue) ![TypeScript](https://img.shields.io/badge/TypeScript-5.6-blue) ![Node.js](https://img.shields.io/badge/Node.js-20-green)

An advanced global investment insights platform leveraging intelligent data aggregation, real-time AI analysis, and interactive visualization technologies to provide comprehensive economic intelligence.

## 📚 Complete Documentation Suite

- **[USER_MANUAL.md](./USER_MANUAL.md)** - Complete user guide with step-by-step instructions
- **[TECHNICAL_SPECIFICATIONS.md](./TECHNICAL_SPECIFICATIONS.md)** - Comprehensive technical architecture
- **[DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md)** - Hosting and deployment instructions
- **[DIGITAL_OCEAN_SETUP.md](./DIGITAL_OCEAN_SETUP.md)** - Digital Ocean specific deployment guide

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- npm or yarn
- API keys for News API and OpenRouter

### Installation
```bash
# Install dependencies
npm install

# Copy environment template
cp .env.example .env

# Add your API keys to .env file
# NEWS_API_KEY=your_news_api_key
# OPENROUTER_API_KEY=your_openrouter_api_key

# Start development server
npm run dev

# Open http://localhost:5000
```

### GitHub Setup and Digital Ocean Deployment
```bash
# For Linux/Mac
./setup-github-deploy.sh

# For Windows
setup-github-deploy.bat
```

## 🎯 Features

### P3 Framework (Predict, Prevent, Protect)
- **Predict**: AI-powered economic forecasting and trend analysis
- **Prevent**: Risk identification and mitigation strategies  
- **Protect**: Investment protection recommendations

### Multi-Source Intelligence
- Real-time economic data from World Bank Open Data (data.worldbank.org)
- AI-enhanced analysis using Mistral AI via OpenRouter
- News sentiment analysis for market context
- Environmental and climate risk assessment
- Credit ratings from S&P Global Ratings via Wikipedia
- Natural disaster risk from World Risk Index via Wikipedia

### Interactive Visualizations
- Economic indicator charts (GDP, unemployment, inflation)
- Comparative analysis dashboards
- Risk assessment matrices
- Investment opportunity mapping

## 🛠️ Technology Stack

### Frontend
- **React 18** with TypeScript
- **Vite** for fast development and building
- **Tailwind CSS** + **Shadcn/UI** for styling
- **TanStack Query** for data fetching
- **Recharts** for data visualization
- **Framer Motion** for animations

### Backend
- **Node.js 20** with Express.js
- **TypeScript** for type safety
- **In-memory storage** for development
- **RESTful API** architecture

### APIs & Data Sources
- **World Bank Open Data** (data.worldbank.org) - Economic indicators
- **News API** - Real-time news analysis
- **OpenRouter** - Mistral AI integration
- **CDP Data** - Climate disclosure information
- **Wikipedia** - Credit ratings and disaster risk data

## 🌐 Deployment Options

### Digital Ocean App Platform (Recommended)
1. Push code to GitHub
2. Connect repository to Digital Ocean App Platform
3. Configure build settings and environment variables
4. Deploy with one click

### Docker Deployment
```bash
# Build and run with Docker
docker-compose up -d

# Check status
docker-compose ps
```

### Traditional Hosting
- VPS deployment with PM2
- Shared hosting with Node.js support
- Cloud platforms (AWS, Google Cloud, Azure)

## 📋 Environment Variables

```env
# Required
NEWS_API_KEY=your_news_api_key
OPENROUTER_API_KEY=your_openrouter_api_key

# Optional
NODE_ENV=production
PORT=5000
```

## 🔧 Build Commands

```bash
# Development
npm run dev

# Production build
npm run build

# Start production server
npm start

# Type checking
npm run check
```

## 📊 API Endpoints

- `GET /api/countries` - List available countries
- `POST /api/analyze` - Comprehensive country analysis
- `GET /api/economic/gdp-growth/:code` - GDP growth data
- `GET /api/economic/unemployment/:code` - Unemployment data
- `GET /api/nib/recommendations` - NIB investment recommendations

## 📈 Use Cases

- **Investment Analysis**: Country risk assessment for portfolio allocation
- **Economic Research**: Comprehensive economic indicator tracking
- **Risk Management**: Multi-factor risk assessment models
- **Strategic Planning**: AI-powered investment strategy development

## 🔒 Security Features

- Environment variable protection
- Input validation with Zod schemas
- Rate limiting for API endpoints
- Secure HTTP headers
- HTTPS enforcement in production

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes with tests
4. Submit pull request

## 📄 License

MIT License - see LICENSE file for details

## 🆘 Support

- Check documentation files for detailed guides
- Review API endpoint documentation
- Consult troubleshooting sections in deployment guides
- Verify environment variable configuration

## 🎉 Getting Started

1. **Clone or download** this repository
2. **Run setup script**: `./setup-github-deploy.sh` (Linux/Mac) or `setup-github-deploy.bat` (Windows)
3. **Add API keys** to your environment variables
4. **Deploy to Digital Ocean** using the App Platform
5. **Access your application** at the provided URL

Your Risk Sense AI platform will be ready to provide comprehensive investment analysis with real-time data and AI-powered insights!