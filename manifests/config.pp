class beats::config() {
  file { '/etc/beats/':
    ensure => 'directory',
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
  }
    
  if $beats::enable_packetbeat { contain beats::packetbeat::config }
  
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
