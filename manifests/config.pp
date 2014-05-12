class packetbeat::config(
  $host = $packetbeat::params::host,
  $port = $packetbeat::params::port,
  $interfaces = $packetbeat::params::interfaces,
  $disable_procs = $packetbeat::params::disable_procs,
  $agentname = $packetbeat::params::agentname ,
  $uid = $packetbeat::params::uid,
  $gid = $packetbeat::params::gid,
){


  file { '/etc/packetbeat/':
    ensure => 'directory',
    group  => '0',
    mode   => '0755',
    owner  => '0',
  }

  concat { '/etc/packetbeat/packetbeat.conf':
    group   => '0',
    mode    => '0755',
    owner   => '0',
    notify  => Service['packetbeat']
  }

  concat::fragment {'head':
    target  => '/etc/packetbeat/packetbeat.conf',
    content => template('packetbeat/packetbeat.conf.erb'),
    order   => 0,
  }

  concat::fragment {'protocols':
    target  => '/etc/packetbeat/packetbeat.conf',
    content => '[protocols]
',
    order   => 19,
  }
  concat::fragment {'procs':
    target  => '/etc/packetbeat/packetbeat.conf',
    content => template('packetbeat/procs.conf.erb'),
    order   => 39,
  }

}

