FROM node:16-alpine AS build
WORKDIR /app
COPY . ./
RUN npm install --fetch-timeout=600000
RUN npm run build

# Second stage: serve the static files with Nginx
FROM nginx:alpine
COPY --from=build /app/dist/summer-workshop-angular /usr/share/nginx/html
