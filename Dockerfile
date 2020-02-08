FROM alpine:latest

RUN apk add curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/arm/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin

ADD kubectl-init.sh /usr/local/bin

ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]


