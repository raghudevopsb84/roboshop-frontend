#FROM              nginx:1.24
#RUN               rm -rf /usr/share/nginx/html/*
#COPY              ./ /usr/share/nginx/html/
#COPY              default.conf /etc/nginx/conf.d/default.conf
#COPY              nginx.conf /etc/nginx/nginx.conf

FROM               redhat/ubi9
RUN                dnf install nginx -y
RUN                rm -rf /usr/share/nginx/html/*
COPY               ./ /usr/share/nginx/html/
COPY               nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT         ["nginx", "-e", "stderr", "-g", "daemon off;"]
