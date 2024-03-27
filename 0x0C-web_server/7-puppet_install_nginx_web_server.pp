#  install and configure an Nginx server
package { 'nginx':
    ensure   => install,
}

file { 'html':
    ensure  => present,
    path    => '/var/www/html/index.nginx-debian.html',
    content => 'Hello World!',
}

file { 'redirect':
    path    => '/etc/nginx/sites-available/default',
    ensure  => present,
    content => 'server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        location /redirect_me {
            return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }
    }'
}

exec { 'restart':
    command  => 'sudo service nginx restart',
}