FROM node:16
WORKDIR /app
#COPY package.json package-lock.json ./
COPY . /app/
#RUN npm install
# RUN npm install and npm-install-peers
#RUN npm install --silent
#COPY . .
RUN cd /app
RUN npm install -g npm@9.2.0
RUN npm install -g @angular/cli@latest
RUN ng build --base-href=.





### Stage 2 : RUN ###
FROM nginx:1.16.0-alpine
COPY  dist/rnt-portfolio  /usr/share/nginx/html




RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d





##Expose port 80
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
