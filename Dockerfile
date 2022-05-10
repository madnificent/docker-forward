FROM node:4

EXPOSE 80

RUN npm install -g mapport
ENV REMOTE_HOST="172.17.0.1"

CMD mapport 80 $REMOTE_HOST:$REMOTE_PORT
