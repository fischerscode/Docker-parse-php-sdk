FROM ubuntu:xenial AS build

RUN echo $parse_version

RUN apt-get update
RUN apt-get install -y git

RUN git clone https://github.com/parse-community/parse-php-sdk.git -b 1.6.0 /parse-php-sdk

FROM php:7.4-fpm

COPY --from=build /parse-php-sdk /parse-php-sdk