FROM node:latest

WORKDIR /app

COPY . .

RUN cd express-website && npm install -g express && \

 npm install -g express-generator

RUN express express-websit && \
  cd express-website/ && \
  npm install && \

  npm install --save nodemailer

EXPOSE 3000

WORKDIR /app/express-website

CMD npm start
