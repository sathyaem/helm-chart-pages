FROM nginx

ENV BASE_URL localhost:8080

RUN apt-get update -y

RUN apt-get -y install curl nodejs npm

RUN node -v

RUN npm -v

RUN npm install -g newman

RUN newman -v

# CMD ["/bin/sh -c while true; do date; sleep 5000; done" ]