# Ensure Python pip is installed
package { 'python3-pip':
  ensure => installed,
}

# Install Flask using pip3 with the specified version
exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  path    => ['/usr/bin', '/usr/local/bin'],
  unless  => '/usr/bin/pip3 show Flask | grep -q "^Version: 2.1.0$"',
}
