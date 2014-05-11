class packetbeat::config(
  $host = 'localhost',
  $port = '9200',
  $interfaces = 'any',
  $disable_procs = 'true',
  $agentname = $::fqdn ,
  $uid = '501',
  $gid = '501',
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

