class packetbeat::outputs::redis (
  $enabled = $packetbeat::redis_enabled,
  $host = $packetbeat::redis_host,
  $port = $packetbeat::redis_port,
  $reconnect_interval = '1',
  $save_topology = false,
  $db_topology = '1',
  $password = '',
  $timeout = '5',
  $index = 'packetbeat',
  $db = '0',
) {
  concat::fragment {'output.redis':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/outputs/redis.erb'),
    order   => 22
  }
}
