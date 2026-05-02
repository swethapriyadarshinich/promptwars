# Stage 1: Build the Vite React application
FROM node:20-alpine as build
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source files and build
COPY . .
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:alpine

# Copy the built assets from the previous stage
COPY --from=build /app/dist /usr/share/nginx/html

# Copy our custom Nginx config for Single Page Applications
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Google Cloud Run provides the PORT environment variable (default 8080).
# We must use sed to dynamically update the nginx listen port when the container starts.
ENV PORT=8080
CMD sed -i -e 's/listen.*/listen '"$PORT"';/' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
