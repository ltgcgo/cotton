#FROM docker.io/chainguard/wolfi-base:latest
FROM docker.io/alpine:3.20

WORKDIR /root

COPY ./includes /root/
RUN sh /root/install.sh

EXPOSE 5000
CMD ["sh", "run.sh"]