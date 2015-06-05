class packetbeat::protocols::redis (
  $ports    = '3306'
) {
  concat::fragment {'protocols-redis':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/protocols/protocols.redis.erb'),
    order   => 14,
  }
}