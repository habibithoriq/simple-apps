FROM node:18.20.0-slim
WORKDIR /app
ADD . .
RUN npm install 
CMD npm start 
