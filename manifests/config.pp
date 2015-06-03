class packetbeat::config() inherits packetbeat {

  file { '/etc/packetbeat/':
    ensure => 'directory',
    group  => '0',
    mode   => '0755',
    owner  => '0',
  }

  concat { '/etc/packetbeat/packetbeat.yml':
    group   => '0',
    mode    => '0755',
    owner   => '0',
    notify  => Service['packetbeat']
  }

  concat::fragment {'head':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/packetbeat.yml.erb'),
    order   => 0,
  }
  concat::fragment {'protocols.header':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/protocols/protocols.header.erb'),
    order   => 10,
  }
  concat::fragment {'output.head':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/outputs/output.header.erb'),
    order   => 20
  }
}
