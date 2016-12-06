# Packetbeat config
class beats::packetbeat::config inherits ::beats::packetbeat {
  beats::common::headers {'packetbeat':}
  concat::fragment {'packetbeat.header':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/packetbeat/packetbeat.yml.erb'),
    order   => '05',
  }
  concat::fragment {'protocols.header':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/protocols.header.erb'),
    order   => '10',
  }
  if $::beats::packetbeat::http_enabled { include ::beats::protocols::http }
  if $::beats::packetbeat::mysql_enabled { include ::beats::protocols::mysql }
  if $::beats::packetbeat::pgsql_enabled { include ::beats::protocols::pgsql }
  if $::beats::packetbeat::redis_enabled { include ::beats::protocols::redis }
}
