class packetbeat::protocols::mysql (
  $protocol = 'mysql',
  $ports    = '3306',
  $max_rows = '10',
  $max_row_length = '1024'
) {
  concat::fragment {"protocols-mysql":
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/protocols/protocols.database.erb'),
    order   => 12,
  }
}