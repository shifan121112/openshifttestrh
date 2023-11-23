FROM nginx:1.25.2-alpine


RUN echo "Welcome to the OpenShift Demo" > /usr/share/nginx/html/index.html


RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx && \
    chgrp -R root /var/cache/nginx && \
    sed -i.bak 's/listen\(.*\)80;/listen 8080;/' /etc/nginx/conf.d/default.conf && \
    sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf && \
    addgroup nginx root

EXPOSE 8080

USER nginx
