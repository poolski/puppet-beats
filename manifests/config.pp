class beats::config() inherits beats {

  file { '/etc/beats/':
    ensure => 'directory',
    group  => '0',
    mode   => '0755',
    owner  => '0',
  }

  concat { '/etc/beats/beats.yml':
    group  => '0',
    mode   => '0755',
    owner  => '0',
    notify => Service['beats']
  }

  concat::fragment {'head':
    target  => '/etc/beats/beats.yml',
    content => template('beats/beats.yml.erb'),
    order   => 0,
  }
  concat::fragment {'runopts':
    target  => '/etc/beats/beats.yml',
    content => template('beats/runopts.erb'),
    order   => 1,
  }
  concat::fragment {'protocols.header':
    target  => '/etc/beats/beats.yml',
    content => template('beats/protocols/protocols.header.erb'),
    order   => 10,
  }
  concat::fragment {'output.head':
    target  => '/etc/beats/beats.yml',
    content => template('beats/outputs/output.header.erb'),
    order   => 20
  }

  concat::fragment {'procs.head':
    target  => '/etc/beats/beats.yml',
    content => template('beats/procs.header.erb'),
    order   => 30
  }

  if $beats::es_enabled {
    concat::fragment {'output.elasticsearch':
      target  => '/etc/beats/beats.yml',
      content => template('beats/outputs/elasticsearch.erb'),
      order   => 21
    }
  }
  if $beats::redis_enabled {
    concat::fragment {'output.redis':
      target  => '/etc/beats/beats.yml',
      content => template('beats/outputs/redis.erb'),
      order   => 22
    }
  }
  if $beats::file_enabled {
    concat::fragment {'output.file':
      target  => '/etc/beats/beats.yml',
      content => template('beats/outputs/file.erb'),
      order   => 23
    }
  }
}
