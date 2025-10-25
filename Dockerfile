# 1. Base image
FROM node:18-alpine

# 2. Set working directory
WORKDIR /app

# 3. Copy package.json and package-lock.json
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy the rest of the application code
COPY . .

# 6. Build TypeScript code
RUN npm run build

# 7. Expose port and start the application
EXPOSE 3001
CMD ["node", "dist/index.js"]
