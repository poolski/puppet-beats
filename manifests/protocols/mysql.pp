class packetbeat::protocols::mysql (
  $protocol       = 'mysql',
  $ports          = ['3306'],
  $max_rows       = undef,
  $max_row_length = undef
) {
  concat::fragment {'protocols-mysql':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/protocols/protocols.database.erb'),
    order   => 12,
  }
}