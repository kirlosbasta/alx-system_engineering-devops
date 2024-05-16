# increase the soft limit for nginx
exec {'increase soft limit':
    path    => '/etc/default/nginx',
    command => "/bin/sed -i 's/15/4096/g' /etc/default/nginx"
}

exec {'restart nginx':
    require => Exec['increase soft limit'],
    command => '/usr/sbin/service nginx restart'
}
