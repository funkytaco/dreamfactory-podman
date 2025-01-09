FROM dreamfactorysoftware/df-base-img:latest

LABEL maintainer="DreamFactory <dev-team@dreamfactory.com>"

# Uncomment for licensed version
#COPY dreamfactory.license /usr/local/bin/
#COPY composer.json /opt/dreamfactory/
#COPY composer.lock /opt/dreamfactory/

WORKDIR /opt/dreamfactory

# Uncomment and add license key for licensed version
#ENV LICENSE_KEY=

RUN composer install --no-dev

EXPOSE 80

CMD ["/usr/local/bin/entrypoint.sh"]