class beats::packetbeat::config(
  $ensure           = present,
  $interfaces       = 'any',
  $int_snaplen      = undef,
  $int_sniffer_type = undef,
  $int_buffer_size  = undef,
){
  concat { '/etc/packetbeat/packetbeat.yml':
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
    order  => 'numeric',
  }
  concat::fragment {'packetbeat-commoon-shipper-config':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/shipper.erb'),
    order   => 01,
  }
  concat::fragment {'packetbeat-common-runopts':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/runopts.erb'),
    order   => 02,
  }
  concat::fragment {'packetbeat.header':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/packetbeat/packetbeat.yml.erb'),
    order   => 05,
  }
  concat::fragment {'protocols.header':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/protocols/protocols.header.erb'),
    order   => 10,
  }
}