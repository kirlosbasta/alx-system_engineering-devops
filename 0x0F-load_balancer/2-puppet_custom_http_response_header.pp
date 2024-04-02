#  install and configure an Nginx server
exec { 'apt_update':
    command => '/usr/bin/apt-get update',
    path    => ['/usr/bin', '/bin', '/usr/sbin', '/sbin'],
    require => Exec['apt_upgrade'],
}

package { 'nginx':
    ensure   => installed,
}

file_line { 'http_header':
    ensure => present,
    path   => '/etc/nginx/sites-available/default',
    after  => 'server_name _;',
    line   => "\tadd_header X-Served-By \"${hostname}\";",
}

service { 'nginx':
    ensure => running,
    enable => true,
    notify => Exec['restart_nginx'],
}

exec { 'restart_nginx':
 command => '/usr/sbin/service nginx restart',
 path    => ['/usr/sbin', '/usr/bin', '/sbin', '/bin'],
 refreshonly => true,
}
