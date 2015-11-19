class beats::packetbeat::config(
  $ensure           = present,
  $interfaces       = 'any',
  $int_snaplen      = undef,
  $int_sniffer_type = undef,
  $int_buffer_size  = undef,
){
  beats::common::headers {'packetbeat':}
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