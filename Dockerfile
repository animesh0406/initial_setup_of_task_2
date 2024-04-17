FROM ubuntu

RUN apt-get update && \
    apt-get install -y nodejs npm

WORKDIR /app


EXPOSE 3000
EXPOSE 4006


ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]

