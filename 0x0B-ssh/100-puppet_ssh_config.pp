# Make changes to ssh configuration file
$config = 'Host *
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
    BatchMode yes'

file_line { 'Identity File':
    path    => '/etc/ssh/ssh_config',
    ensure  => present,
    line    => 'IdentityFile ~/.ssh/school',
}

file_line { 'Password Authentication':
    path    => '/etc/ssh/ssh_config',
    ensure  => present,
    line    => 'PasswordAuthentication no',
}