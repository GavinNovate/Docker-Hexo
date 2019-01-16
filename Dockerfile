FROM novate/node

RUN buildDeps='git-core ca-certificates' \
  && apt-get update \
  && apt-get install -y $buildDeps --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g hexo-cli \
  && hexo init /var/opt/hexo \
  && apt-get purge -y --auto-remove $buildDeps

EXPOSE 4000

VOLUME /var/opt/blog

WORKDIR /var/opt/blog

COPY assets/wrapper /usr/local/bin/

CMD ["/usr/local/bin/wrapper"]
