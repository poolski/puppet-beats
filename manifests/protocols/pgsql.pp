class packetbeat::protocols::pgsql (
  $protocol = 'pgsql',
  $ports    = '5432',
  $max_rows = '10',
  $max_row_length = '1024'
) {
  concat::fragment {"protocols-pgsql":
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/protocols/protocols.database.erb'),
    order   => 13,
  }
}