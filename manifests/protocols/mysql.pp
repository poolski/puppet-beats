class beats::protocols::mysql (
  $protocol       = $beats::packetbeat::config::mysql_protocol,
  $ports          = $beats::packetbeat::config::mysql_ports,
  $max_rows       = $beats::packetbeat::config::mysql_max_rows,
  $max_row_length = $beats::packetbeat::config::mysql_max_row_length
) {
  concat::fragment {'protocols-mysql':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/protocols/protocols.database.erb'),
    order   => 12,
  }
}