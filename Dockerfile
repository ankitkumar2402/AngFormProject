FROM nginx:alpine

RUN apk update
RUN apk upgrade
RUN apk add bash

#COPY src/index.html /usr/share/nginx/html/formdemo/index.html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
COPY dist/form-demo /usr/share/nginx/html/

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]




#FROM nginx:alpine
#RUN apk update
#RUN apk upgrade
#RUN apk add bash

#RUN mkdir -p /app
#WORKDIR /app
#COPY package.json /app

#RUN npm install
#COPY . /app
#RUN npm run-script build


#COPY dist/form-demo/index.html /usr/share/nginx/html/index.html
#COPY dist/form-demo /usr/share/nginx/html

#COPY src/index.html /app/index.html
#COPY dist /app/ui

#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]

#stage 1
#FROM node:10-alpine as build-step
#RUN mkdir -p /app
#WORKDIR /app
#COPY package.json /app
#RUN npm install
#COPY . /app
#RUN npm run build --prod
# Stage 2
#FROM nginx:alpine
#COPY --from=build-step /app/docs /usr/share/nginx/html



#this is which i used n build succeded
# Stage 0, "build-stage", based on Node.js, to build and compile the frontend
#below commands works
#FROM node:14-alpine as builder
#WORKDIR /app
#COPY package*.json /app/
#COPY ./ /app/
#RUN npm install --production

#ARG configuration=production
#RUN npm run-script build -- --output-path=./dist/form-demo --configuration $configuration
#CMD [ "npm", "start" ]

#till here
# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
#FROM nginx:alpine
#Copy ci-dashboard-dist
#COPY --from=builder /app/dist/form-demo/ /usr/share/nginx/html
#Copy default nginx configuration
#COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
#EXPOSE 8080
#CMD ["nginx", "-g", "daemon off;"]
