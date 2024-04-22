#
class trellix_agent::epa {
  package { 'epa':
    ensure => installed,
    source => 'puppet///modules/files/epa.rpm',
  }

  file { '/var/tmp/EPAinstall.sh':
    ensure  => file,
    source  => 'puppet///modules/files/epa.sh',
    require => Package[''],
  }

  exec { 'install epa':
    command => 'yes "" | /var/tmp/EPAinstall.sh -i',
    creates => '/var/eracent.epa/epa.sh',
    require => File['/var/tmp/EPAinstall.sh'],
  }

  service { 'EracentEUAService':
    ensure  => running,
    enable  => true,
    require => Exec['install epa'],
  }
}
