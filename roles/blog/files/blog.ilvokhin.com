server {
    server_name blog.ilvokhin.com www.blog.ilvokhin.com;

    root /srv/http/blog.ilvokhin.com;
    index index.html;

    location / {
        try_files $uri $uri/ = 404;
    }

    listen [::]:443 ssl;
    listen 443 ssl;

    ssl_certificate /etc/letsencrypt/live/blog.ilvokhin.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/blog.ilvokhin.com/privkey.pem;
}

server {
    if ($host = www.blog.ilvokhin.com) {
        return 301 https://$host$request_uri;
    }

    if ($host = blog.ilvokhin.com) {
        return 301 https://$host$request_uri;
    }

    server_name blog.ilvokhin.com www.blog.ilvokhin.com;

    listen 80;
    listen [::]:80;
    return 404;
}
