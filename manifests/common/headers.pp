define beats::common::headers (
  $agentname             = $beats::agentname,
  $tags                  = $beats::tags,
  $refresh_topology_freq = $beats::refresh_topology_freq,
  $ignore_outgoing       = $beats::ignore_outgoing,
) {
  concat { "/etc/${title}/${title}.yml":
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
    order  => 'numeric',
  }
  concat::fragment {'${title}-commoon-shipper-config':
    target  => '/etc/${title}/${title}.yml',
    content => template('beats/shipper.erb'),
    order   => 01,
  }
  concat::fragment {'${title}-common-runopts':
    target  => '/etc/${title}/${title}.yml',
    content => template('beats/runopts.erb'),
    order   => 02,
  }
  concat::fragment {"${title}-common-output-header":
    target  => "/etc/${title}/${title}.yml",
    content => template('beats/outputs/output.header.erb'),
    order   => 20
  }
  if $beats::es_enabled {
    concat::fragment {'${title}-output-elasticsearch':
      target  => '/etc/${title}/${title}.yml',
      content => template('beats/outputs/elasticsearch.erb'),
      order   => 21
    }
  }
  if $beats::redis_enabled {
    concat::fragment {'${title}-output-redis':
      target  => '/etc/${title}/${title}.yml',
      content => template('beats/outputs/redis.erb'),
      order   => 22
    }
  }
  if $beats::file_enabled {
    concat::fragment {'${title}-output-file':
      target  => '/etc/${title}/${title}.yml',
      content => template('beats/outputs/file.erb'),
      order   => 23
    }
  }
}