FROM php:alpine

LABEL maintainer="pinkywithabrain@gmail.com"

RUN apk update && \
    apk add git zip && \
    curl --silent --show-error https://getcomposer.org/installer | php && \
    php composer.phar global require allocine/twigcs:v2.1.0 && \
    ln -snf /root/.composer/vendor/allocine/twigcs/bin/twigcs /usr/local/bin/twigcs && \
    apk del git zip

ENTRYPOINT ["/usr/local/bin/twigcs", "lint"]
