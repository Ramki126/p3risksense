# Digital Ocean Deployment Guide for Risk Sense AI

## Prerequisites

- Digital Ocean account
- Domain name (optional but recommended)
- GitHub account
- API keys for News API and OpenRouter

## Deployment Options

### Option 1: Digital Ocean App Platform (Recommended)

#### Step 1: Prepare Your GitHub Repository
1. Push your code to GitHub with the corrected package.json
2. Ensure package-lock.json is committed
3. Set repository to public or connect your GitHub account

#### Step 2: Create Digital Ocean App
1. Go to Digital Ocean Dashboard
2. Click "Create" → "Apps"
3. Connect your GitHub repository
4. Configure build settings:
   - **Build Command**: `npm run build`
   - **Run Command**: `npm start`
   - **Environment**: Node.js
   - **Port**: 5000

#### Step 3: Configure Environment Variables
In the App Platform settings, add:
```
NODE_ENV=production
PORT=5000
NEWS_API_KEY=your_news_api_key
OPENROUTER_API_KEY=your_openrouter_api_key
```

#### Step 4: Deploy
- Click "Create Resources"
- Wait for deployment (5-10 minutes)
- Your app will be available at `https://your-app-name.ondigitalocean.app`

### Option 2: Digital Ocean Droplet with Docker

#### Step 1: Create Droplet
1. Create a new droplet (Ubuntu 22.04 LTS)
2. Choose size: $6/month (1GB RAM) minimum
3. Add SSH key for secure access

#### Step 2: Connect and Setup
```bash
# Connect to droplet
ssh root@your_droplet_ip

# Update system
apt update && apt upgrade -y

# Install Docker and Docker Compose
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Verify installation
docker --version
docker-compose --version
```

#### Step 3: Deploy Application
```bash
# Clone your repository
git clone https://github.com/yourusername/risk-sense-ai.git
cd risk-sense-ai

# Create environment file
cp .env.example .env
nano .env  # Add your API keys

# Build and start containers
docker-compose up -d

# Check status
docker-compose ps
docker-compose logs -f risk-sense-ai
```

#### Step 4: Configure Nginx (Optional)
```bash
# Install Nginx
apt install nginx -y

# Configure reverse proxy
nano /etc/nginx/sites-available/risk-sense-ai

# Add this configuration:
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

# Enable site
ln -s /etc/nginx/sites-available/risk-sense-ai /etc/nginx/sites-enabled/
nginx -t
systemctl reload nginx
```

### Option 3: Digital Ocean Kubernetes

#### Step 1: Create Kubernetes Cluster
1. Go to Digital Ocean Dashboard
2. Click "Create" → "Kubernetes"
3. Choose cluster configuration
4. Download kubeconfig file

#### Step 2: Deploy Application
```bash
# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

# Set kubeconfig
export KUBECONFIG=/path/to/kubeconfig.yaml

# Create deployment
kubectl create deployment risk-sense-ai --image=your-dockerhub-username/risk-sense-ai:latest
kubectl expose deployment risk-sense-ai --port=5000 --type=LoadBalancer

# Check status
kubectl get pods
kubectl get services
```

## Domain Configuration

### Step 1: Point Domain to Digital Ocean
1. In your domain registrar, update nameservers to:
   - ns1.digitalocean.com
   - ns2.digitalocean.com
   - ns3.digitalocean.com

### Step 2: Create DNS Records
1. Go to Digital Ocean Networking
2. Add your domain
3. Create A record pointing to your droplet IP or load balancer

### Step 3: SSL Certificate (Let's Encrypt)
```bash
# Install Certbot
apt install certbot python3-certbot-nginx -y

# Get SSL certificate
certbot --nginx -d your-domain.com

# Auto-renewal
systemctl enable certbot.timer
```

## Monitoring and Maintenance

### Application Monitoring
```bash
# Check application logs
docker-compose logs -f risk-sense-ai

# Monitor resource usage
docker stats

# Check health
curl http://localhost:5000/api/countries
```

### System Monitoring
```bash
# Check system resources
htop
df -h
free -h

# Monitor nginx logs
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log
```

### Backup Strategy
```bash
# Create backup script
#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
docker-compose exec risk-sense-ai npm run db:backup > backup_$DATE.sql
```

## Security Considerations

### Firewall Configuration
```bash
# Enable UFW
ufw enable

# Allow SSH
ufw allow ssh

# Allow HTTP/HTTPS
ufw allow 80
ufw allow 443

# Check status
ufw status
```

### Regular Updates
```bash
# Update system packages
apt update && apt upgrade -y

# Update Docker images
docker-compose pull
docker-compose up -d
```

## Troubleshooting

### Common Issues

1. **Build Fails**: Check package.json and package-lock.json are committed
2. **API Errors**: Verify environment variables are set correctly
3. **Port Issues**: Ensure port 5000 is not blocked by firewall
4. **Memory Issues**: Upgrade droplet size if needed

### Debugging Commands
```bash
# Check container logs
docker-compose logs risk-sense-ai

# Access container shell
docker-compose exec risk-sense-ai sh

# Check environment variables
docker-compose exec risk-sense-ai env

# Test API endpoints
curl http://localhost:5000/api/countries
```

## Performance Optimization

### Caching
- Enable Redis for API response caching
- Configure CDN for static assets
- Implement nginx caching rules

### Scaling
- Use Digital Ocean Load Balancer for multiple instances
- Implement horizontal pod autoscaling in Kubernetes
- Consider App Platform auto-scaling features

## Cost Optimization

### App Platform
- Basic plan: $5/month for small applications
- Pro plan: $12/month for production workloads

### Droplet
- Basic: $6/month (1GB RAM)
- Standard: $12/month (2GB RAM)
- Premium: $24/month (4GB RAM)

### Additional Services
- Load Balancer: $12/month
- Managed Database: $15/month
- Block Storage: $1/month per 10GB

Choose the option that best fits your needs and budget. App Platform is recommended for beginners, while Droplet with Docker provides more control for advanced users.