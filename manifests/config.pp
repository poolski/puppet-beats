class beats::config() {

  file { '/etc/beats/':
    ensure => 'directory',
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
  }
  concat { '/etc/beats/beats.yml':
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
    order  => 'numeric',
  }
  concat::fragment {'beats-commoon-shipper-config':
    target  => '/etc/beats/beats.yml',
    content => template('beats/shipper.erb'),
    order   => 01,
  }
  concat::fragment {'beats-common-runopts':
    target  => '/etc/beats/beats.yml',
    content => template('beats/runopts.erb'),
    order   => 02,
  }
  
  if $beats::enable_packetbeat { contain beats::packetbeat::config }
  
  concat::fragment {'beats-common-output-header':
    target  => '/etc/beats/beats.yml',
    content => template('beats/outputs/output.header.erb'),
    order   => 20
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
