FROM node:4.4.7

RUN apt-get update && apt-get -y --no-install-recommends install \
    vim curl

WORKDIR /app
ADD package.json /app/package.json
RUN npm install
ADD typings.json /app/typings.json
RUN npm run typings

ADD . /app
RUN npm run compile

ENV NODE_ENV production
ENV DEBUG false
EXPOSE 3333
CMD npm start
