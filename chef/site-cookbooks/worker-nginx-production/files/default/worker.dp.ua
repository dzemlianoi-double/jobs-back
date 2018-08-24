upstream puma {
  server unix:///home/worker/sites/worker/shared/tmp/sockets/puma.sock fail_timeout=0;
}

server {
  listen 80;

  gzip on;
  gzip_comp_level 2;
  gzip_http_version 1.0;
  gzip_proxied any;
  gzip_min_length 1100;
  gzip_buffers 16 8k;
  gzip_types
    text/plain
    text/html
    text/css
    text/javascript
    application/javascript
    application/x-javascript
    image/svg+xml;
  gzip_disable "MSIE [1-6].(?!.*SV1)";
  gzip_vary on;

  client_max_body_size 100m;

  server_name 206.189.196.251;

  rewrite ^(/.*)\.html(\?.*)?$ $1$2 permanent;
  rewrite ^(/.*)\.php(\?.*)?$ $1$2 permanent;
  rewrite ^/(.*)/$ /$1 permanent;

  root /home/worker/sites/worker/current/public;

  resolver 8.8.8.8 8.8.4.4 208.67.222.222 valid=300s;
  resolver_timeout 10s;

  add_header Strict-Transport-Security "max-age=31536000;";

  location /apis {
    try_files $uri @puma;
  }

  location /admin {
     try_files $uri @puma;
  }

  location /assets {
    try_files $uri @puma;
  }

  location / {
    root /home/worker/sites/worker-front;
    index index.html;
    rewrite ^/$ /index.html break;
    try_files $uri $uri/ /index.html =404;
  }

  location ~*  \.(jpg|jpeg|png|gif|ico|css|js|woff)$ {
    access_log off;
    add_header Cache-Control "public";
    expires 365d;
  }

  location ~* \.(?:eot|ttf|svg)$ {
    access_log off;
    add_header Vary Accept-Encoding;
    expires 365d;
  }

  location @puma {
    proxy_set_header Client-Ip $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header Host $host;
    proxy_pass http://puma;
  }
}
