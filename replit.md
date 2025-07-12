# Risk Sense AI - Smart Investment Analysis Platform

## Overview

Risk Sense AI is an advanced global investment insights platform that leverages intelligent data aggregation, real-time AI analysis, and interactive visualization technologies to provide comprehensive economic intelligence. The platform implements a P3 Framework (Predict, Prevent, Protect) for strategic investment decision-making and includes specialized recommendations for the Nordic Investment Bank (NIB).

## User Preferences

Preferred communication style: Simple, everyday language.

## System Architecture

### Frontend Architecture
- **React 18** with TypeScript for type-safe component development
- **Vite** as the build tool for fast development and optimized production builds
- **Wouter** for lightweight client-side routing
- **TanStack Query** for data fetching, caching, and synchronization
- **Tailwind CSS + Shadcn/UI** for responsive design and modern component library
- **Recharts** for interactive data visualization
- **Framer Motion** for smooth animations

### Backend Architecture
- **Node.js 20** with Express.js for RESTful API server
- **TypeScript** for type safety across the entire backend
- **In-memory storage** for development (configured for PostgreSQL via Drizzle ORM)
- **Service-oriented architecture** with separate modules for each data source
- **Caching layer** for API responses to improve performance

### Alternative Python Implementation
- **Flask** backend in `rs_ai/` directory providing similar functionality
- Self-contained Python application with HTML/CSS/JavaScript frontend
- Can be used as an alternative to the Node.js implementation

## Key Components

### Data Integration Services
1. **World Bank Service** - Economic indicators, GDP, unemployment, inflation data
2. **News Service** - Real-time news analysis with sentiment scoring via News API
3. **Mistral AI Service** - AI-powered insights via OpenRouter API
4. **CDP Service** - Climate and environmental data processing
5. **NIB Service** - Specialized Nordic Investment Bank recommendations
6. **Project Service** - Risk scenario analysis for investment projects

### Core Features
1. **Multi-tab Analysis Dashboard**
   - Country overview with economic indicators
   - Interactive economic charts
   - News sentiment analysis
   - AI-generated investment insights
   - P3 strategic recommendations
   - Company risk ratings with S&P adjustments
   - Project risk scenario analysis

2. **P3 Framework Implementation**
   - **Predict**: AI-powered economic forecasting
   - **Prevent**: Risk identification and mitigation strategies
   - **Protect**: Investment protection recommendations

3. **Smart Recommendations System**
   - NIB-specific investment recommendations
   - AI-driven analysis of sustainable finance opportunities
   - Infrastructure and innovation project evaluations

## Data Flow

1. **User Input**: Country selection and investment query through form interface
2. **Data Aggregation**: Parallel API calls to multiple data sources (World Bank, News API, CDP)
3. **AI Processing**: Raw data sent to Mistral AI via OpenRouter for intelligent analysis
4. **Cache Management**: Results cached in-memory for improved performance
5. **Visualization**: Processed data rendered through interactive charts and dashboards
6. **Export**: PDF report generation capability for analysis results

## External Dependencies

### Required API Keys
- **News API** (`NEWS_API_KEY`): Real-time news data - 500 requests/day free tier
- **OpenRouter API** (`OPENROUTER_API_KEY`): Mistral AI access - pay-per-use pricing

### Free Data Sources
- **World Bank API**: Economic indicators (no authentication required)
- **CDP Data**: Environmental targets (local JSON dataset)
- **Wikipedia-sourced data**: Credit ratings and disaster risk data

### Third-party Libraries
- Frontend: React ecosystem, Tailwind CSS, Chart.js libraries
- Backend: Express.js, fetch for HTTP requests, Drizzle ORM for database abstraction
- Development: Vite for bundling, TypeScript for type checking

## Deployment Strategy

### Docker Support
- Multi-stage Dockerfile for optimized production builds
- docker-compose.yml for local development with all services
- Environment variable configuration for API keys and database connections

### Database Configuration
- **Development**: In-memory storage for quick setup
- **Production**: PostgreSQL via Drizzle ORM (configured but not actively used)
- Migration support through Drizzle Kit

### Environment Setup
- `.env` file for local configuration
- Separate development and production environment variables
- Health check endpoints for monitoring

### Replit Deployment
- Native Replit support with nix configuration
- Automatic dependency management
- Hot reload development environment

The architecture prioritizes rapid development, scalability, and maintainability while providing comprehensive investment analysis capabilities through multiple data sources and AI-powered insights.