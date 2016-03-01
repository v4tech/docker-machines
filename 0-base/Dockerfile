# My base box
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
            git \
            nano \
            tmux \
            unzip \
            wget \
            zsh && \
    rm -rf /var/lib/apt/lists/*


# Change the shell to using zsh
RUN chsh -s /bin/zsh root

# Clean up to make the image smaller
RUN for x in `ls /usr/share/locale | grep -v -i en | grep -v -i local`; \
      do rm -fr /usr/share/locale/$x; \
    done && \
    rm -fr /usr/share/locale/ca* \
        /usr/share/locale/den \
        /usr/share/locale/men \
        /usr/share/locale/wen \
        /usr/share/locale/zen

CMD ["/bin/zsh"]
