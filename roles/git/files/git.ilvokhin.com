server {
    server_name git.ilvokhin.com;

    auth_basic "Restricted";
    auth_basic_user_file /etc/nginx/auth/git/.htpasswd;

    # Asterisk (*) is here to match both git.conf and cgit.conf (if the latter
    # exists), because cgit comes with a separate role, but they share one
    # server (git.ilvokhin.com) for usage convenience.
    include includes/*git.conf

    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/git.ilvokhin.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/git.ilvokhin.com/privkey.pem;
}

server {
    if ($host = git.ilvokhin.com) {
        return 301 https://$host$request_uri;
    }

    server_name git.ilvokhin.com;
    listen 80;

    return 404;
}
