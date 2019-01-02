FROM novate/node

RUN npm install -g hexo-cli \
  && . ~/.profile \
  && hexo init /var/opt/blog

WORKDIR /var/opt/blog

EXPOSE 4000

VOLUME /var/opt/blog
