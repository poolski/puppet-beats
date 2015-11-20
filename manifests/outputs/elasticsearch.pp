define beats::outputs::elasticsearch (
  $hosts         = ['localhost'],
  $save_topology = true,
  $index         = 'packetbeat',
) {

  if $beats::es_enabled {
    concat::fragment {"${title}-output-elasticsearch":
      target  => "/etc/${title}/${title}.yml",
      content => template('beats/outputs/elasticsearch.erb'),
      order   => 21
    }
  }
  if $beats::redis_enabled {
    concat::fragment {"${title}-output-redis":
      target  => "/etc/${title}/${title}.yml",
      content => template('beats/outputs/redis.erb'),
      order   => 22
    }
  }
  if $beats::file_enabled {
    concat::fragment {"${title}-output-file":
      target  => "/etc/${title}/${title}.yml",
      content => template('beats/outputs/file.erb'),
      order   => 23
    }
  }
}