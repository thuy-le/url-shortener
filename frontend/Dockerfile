FROM node:4.3.2

ARG SOURCES_MIRROR=""
RUN if [ ! -z "${SOURCES_MIRROR}" ]; then echo "$SOURCES_MIRROR" > /etc/apt/sources.list ; fi

RUN npm install -g grunt-cli
WORKDIR /app

# Cache npm install
ADD package.json /app/
RUN npm install

EXPOSE 9999

CMD npm start

# Add code
ADD . /app