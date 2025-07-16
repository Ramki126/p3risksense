FROM node:18-alpine3.18 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM node:18-alpine3.18 AS production

RUN apk add --no-cache dumb-init curl

WORKDIR /app

RUN addgroup -g 1001 -S nodejs
RUN adduser -S nextjs -u 1001

COPY --from=builder /app/dist ./dist
COPY package*.json ./
RUN npm ci --omit=dev

COPY client ./client
COPY cdp_data.json ./

ENV PORT=5000

USER nextjs

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:5000/api/countries || exit 1

ENTRYPOINT ["dumb-init", "--"]
CMD ["npm", "start"]
