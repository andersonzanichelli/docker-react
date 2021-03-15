FROM node:alpine
WORKDIR "/opt/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /opt/app/build /usr/share/nginx/html
