# Postgres
class beats::protocols::pgsql (
  $protocol       = $beats::packetbeat::config::pgsql_protocol,
  $ports          = $beats::packetbeat::config::pgsql_ports,
  $max_rows       = $beats::packetbeat::config::pgsql_max_rows,
  $max_row_length = $beats::packetbeat::config::pgsql_max_row_length
) {
  concat::fragment {'protocols-pgsql':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/protocols/protocols.database.erb'),
    order   => 13,
  }
}