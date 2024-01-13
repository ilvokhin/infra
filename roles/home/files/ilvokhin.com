server {
    server_name ilvokhin.com www.ilvokhin.com;

    root /srv/http/ilvokhin.com;
    index index.html;

    location / {
        try_files $uri $uri/ = 404;
    }

    listen [::]:443 ssl;
    listen 443 ssl;

    ssl_certificate /etc/letsencrypt/live/ilvokhin.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/ilvokhin.com/privkey.pem;
}

server {
    if ($host = www.ilvokhin.com) {
        return 301 https://$host$request_uri;
    }

    if ($host = ilvokhin.com) {
        return 301 https://$host$request_uri;
    }

    server_name ilvokhin.com www.ilvokhin.com;

    listen 80;
    listen [::]:80;

    return 404;
}
