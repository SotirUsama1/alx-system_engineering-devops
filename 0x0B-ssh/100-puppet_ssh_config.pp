# 100-puppet_ssh_config.pp

# Ensure the .ssh directory exists with the correct permissions
file { '/home/ubuntu/.ssh':
  ensure  => directory,
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0700',
}

# Ensure the SSH configuration file exists and is correctly configured
file { '/home/ubuntu/.ssh/config':
  ensure  => file,
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0600',
  content => @("CONFIG")
    Host *
      IdentityFile ~/.ssh/school
      PasswordAuthentication no
    | CONFIG
}
