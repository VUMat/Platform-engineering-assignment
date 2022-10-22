FROM node:16-alpine

COPY package*.json ./

RUN npm install

COPY . /app

WORKDIR /app

EXPOSE 8080

CMD ["npm", "start"]
