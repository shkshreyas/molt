FROM node:22-alpine

WORKDIR /app

# Install OpenClaw globally
RUN npm install -g openclaw

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1

# Run OpenClaw gateway
CMD ["openclaw", "gateway", "--port", "8080"]
