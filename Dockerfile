FROM novate/node

RUN apt-get update \
  && apt-get install -y git-core --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g hexo-cli \
  && hexo init /var/opt/blog

WORKDIR /var/opt/blog

EXPOSE 4000

VOLUME /var/opt/blog

CMD [ "hexo","s" ]
