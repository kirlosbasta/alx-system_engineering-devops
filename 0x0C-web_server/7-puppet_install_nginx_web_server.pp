#  install and configure an Nginx server
package { 'nginx':
    ensure   => installed,
}

file { 'html':
    ensure  => present,
    path    => '/var/www/html/index.nginx-debian.html',
    content => 'Hello World!',
}

file_line {'configure redirection':
    path  =>  '/etc/nginx/sites-available/default',
    after =>  'server_name _;',
    line  =>  "\n\tlocation /redirect_me {\n\t\treturn 301 https://youtu.be/dQw4w9WgXcQ;\n\t}\n"
}

service {'nginx':
    ensure => running,
}