server {
    server_name packages.ilvokhin.com www.packages.ilvokhin.com;

    root /srv/http/packages.ilvokhin.com;
    autoindex on;

    location / {
        try_files $uri $uri/ = 404;
    }

    listen [::]:443 ssl;
    listen 443 ssl;

    ssl_certificate /etc/letsencrypt/live/packages.ilvokhin.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/packages.ilvokhin.com/privkey.pem;
}

server {
    if ($host = www.packages.ilvokhin.com) {
        return 301 https://$host$request_uri;
    }

    if ($host = packages.ilvokhin.com) {
        return 301 https://$host$request_uri;
    }

    server_name packages.ilvokhin.com www.packages.ilvokhin.com;

    listen 80;
    listen [::]:80;

    return 404;
}
