# Make changes to ssh configuration file
$config = 'Host *
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
    BatchMode yes'

file_line { 'Identity File':
    path    => '~/.ssh/config',
    ensure  => present,
    line    => 'IdentityFile ~/.ssh/school',
}

file_line { 'Password Authentication':
    path    => '~/.ssh/config',
    ensure  => present,
    line    => 'PasswordAuthentication no',
}