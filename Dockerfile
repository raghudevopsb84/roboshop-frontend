#FROM              nginx:1.24
#RUN               rm -rf /usr/share/nginx/html/*
#COPY              ./ /usr/share/nginx/html/
#COPY              default.conf /etc/nginx/conf.d/default.conf
#COPY              nginx.conf /etc/nginx/nginx.conf

FROM               redhat/ubi9
RUN                dnf install nginx -y
RUN                ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log
RUN                rm -rf /usr/share/nginx/html/*
COPY               ./ /usr/share/nginx/html/
COPY               nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT         ["nginx", "-g", "daemon off;"]
