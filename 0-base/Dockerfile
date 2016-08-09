# My base box
#
# N.B. As this is a base box it is NOT the smallest image size.
#      Clean it up by the commented out commands below...
#   OR
#      Run one of the prod containers

FROM debian:jessie
MAINTAINER Stewart V. Wright <stewart@vifortech.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Change default server and install dependencies
RUN sed -i "s/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirror.internode.on.net\/pub\/ubuntu\/ubuntu\//g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            ca-certificates \
            curl \
            file \
            git \
            nano \
            tmux \
            unzip \
            wget \
            zsh


# Change the shell to using zsh
RUN chsh -s /bin/zsh root

CMD ["/bin/zsh"]



###############################
# Clean up to make the image smaller by running these if you like...
#RUN apt-get clean && \
#    rm -rf /var/lib/apt/lists/*
#
#RUN for x in `ls /usr/share/locale | grep -v -i en | grep -v -i local`; \
#      do rm -fr /usr/share/locale/$x; \
#    done && \
#    rm -fr /usr/share/locale/ca* \
#        /usr/share/locale/den \
#        /usr/share/locale/men \
#        /usr/share/locale/wen \
#        /usr/share/locale/zen
###############################
