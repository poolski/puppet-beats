class packetbeat::config {


  file { '/etc/packetbeat/':
    ensure => 'directory',
    group  => '0',
    mode   => '0755',
    owner  => '0',
  }

  file { '/etc/packetbeat/packetbeat.conf':
    content => template('packetbeat/packetbeat.conf.erb'),
    group   => '0',
    mode    => '0755',
    owner   => '0',
  }

}

