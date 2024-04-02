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

file_line { 'http_header':
    ensure => present,
    path   => '/etc/nginx/sites-available/default',
    after  => 'server_name _;',
    line   => "\tadd_header X-Served-By ${hostname};",
}

service { 'nginx':
    ensure => running,
}
