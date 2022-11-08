FROM docker.io/library/archlinux:latest
LABEL description="Arch Linux based simple image running nginx"

ENV WD="/root"
WORKDIR ${WD}

# install nginx and print info
COPY nginx.tar.gz ${WD}/
RUN echo "Installing nginx" && \
    tar xvzf nginx.tar.gz && rm nginx.tar.gz && \
    install -d /var/lib/nginx && \
    install -dm700 /var/lib/nginx/proxy && \
    install -dm755 /var/log/nginx && \
    /usr/bin/nginx -v && /usr/bin/nginx -t

EXPOSE 80/tcp
EXPOSE 443/tcp

USER http
WORKDIR /etc/nginx
ENTRYPOINT ["nginx","-g","pid /run/nginx.pid; error_log stderr; daemon off;"]
