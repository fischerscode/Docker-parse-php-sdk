ARG PHP_image="php:7.4-fpm"
ARG parse_version="1.6.0"

FROM ubuntu:xenial AS build

RUN echo $parse_version

RUN apt-get update
RUN apt-get install -y git

RUN git clone https://github.com/parse-community/parse-php-sdk.git -b $parse_version /parse-php-sdk

FROM $PHP_image

COPY --from=build /parse-php-sdk /parse-php-sdk