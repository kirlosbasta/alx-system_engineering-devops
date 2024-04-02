#  install and configure an Nginx server
exec { 'apt_update':
    command => '/usr/bin/apt-get update',
    path    => ['/usr/bin', '/bin', '/usr/sbin', '/sbin'],
    require => Exec['apt_upgrade'],
}

exec { 'apt_upgrade':
    command => '/usr/bin/apt-get upgrade -y',
    path    => ['/usr/bin', '/bin', '/usr/sbin', '/sbin'],
}

package { 'nginx':
    ensure   => installed,
}

file { 'html':
    ensure  => present,
    path    => '/var/www/html/index.nginx-debian.html',
    content => 'Hello World!',
}

file_line { 'configure redirection':
    path  =>  '/etc/nginx/sites-available/default',
    after =>  'server_name _;',
    line  =>  "\n\tlocation /redirect_me {\n\t\treturn 301 https://youtube/dQw4w9WgXcQ;\n\t}\n"
}

file_line { 'http_header':
    path  => '/etc/nginx/sites-available/default',
    after => 'server_name _;',
    line  => "add_header X-Served-By ${hostname};",
}

service { 'nginx':
    ensure => running,
}
