FROM novate/node

RUN apt-get update \
  && apt-get install -y git-core --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g hexo-cli \
  && hexo init /var/opt/hexo

WORKDIR /var/opt/blog

EXPOSE 4000

VOLUME /var/opt/blog

COPY assets/wrapper.sh /usr/local/bin/

CMD ["/usr/local/bin/wrapper.sh"]
