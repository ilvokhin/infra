server {
    server_name ip.ilvokhin.com www.ip.ilvokhin.com;

    location / {
        default_type text/plain;
        return 200 $remote_addr\n;
    }

    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/ip.ilvokhin.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/ip.ilvokhin.com/privkey.pem;
}

# Do not redirect to https to get a plain output for `curl ip.ilvokhin.com`
# command.
server {
    server_name ip.ilvokhin.com www.ip.ilvokhin.com;

    location / {
        default_type text/plain;
        return 200 $remote_addr\n;
    }

    listen 80;
    listen [::]:80;
}
