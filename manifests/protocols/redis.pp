# Redis
class beats::protocols::redis (
  $ports    = '6379'
) {
  concat::fragment {'protocols-redis':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/protocols/protocols.redis.erb'),
    order   => 14,
  }
}