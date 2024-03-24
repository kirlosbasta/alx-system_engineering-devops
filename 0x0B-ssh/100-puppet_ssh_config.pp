# Make changes to ssh configuration file
$config = 'Host *
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
    BatchMode yes'
file { 'ssh':
    path     => '/home/koko/.ssh/config',
    ensure   => present,
    content  => $config,
}