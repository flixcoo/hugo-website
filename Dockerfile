# ---- Stage 1: Build Hugo site ----
FROM alpine:latest AS builder

# Install dependencies
RUN apk add --no-cache git curl tar

# Set working directory
WORKDIR /src

# Copy site content from host
COPY . /src/

# Pull latest changes from main branch
RUN git -C /src pull origin main || true

# Ensure theme submodules are available in the build context
RUN git -C /src submodule update --init --recursive || true

# Install specific Hugo version
ARG HUGO_VERSION=0.152.2
RUN curl -L "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" \
    -o /tmp/hugo.tar.gz && \
    tar -xzf /tmp/hugo.tar.gz -C /usr/local/bin hugo

# Build Hugo site
RUN hugo --minify --destination /public

# ---- Stage 2: Serve built site ----
FROM nginx:alpine

# Copy built static site from builder
COPY --from=builder /public /usr/share/nginx/html
