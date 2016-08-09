FROM v4tech/dev-python:latest
MAINTAINER Stewart V. Wright <stewart@vifortech.com>

# Just make sure (again) that there is nothing unnecessary around
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    for x in `ls /usr/share/locale | grep -v -i en | grep -v -i local`; \
      do rm -fr /usr/share/locale/$x; \
    done && \
    rm -fr /usr/share/locale/ca* \
        /usr/share/locale/den \
        /usr/share/locale/men \
        /usr/share/locale/wen \
        /usr/share/locale/zen && \
    rm -fr /usr/share/doc/* /usr/share/man/* /usr/share/groff/* /usr/share/info/* && \
    rm -rf /usr/share/lintian/* /usr/share/linda/* /var/cache/man/*
