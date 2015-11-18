class beats::protocols::mysql (
  $protocol       = 'mysql',
  $ports          = ['3306'],
  $max_rows       = undef,
  $max_row_length = undef
) {
  concat::fragment {'protocols-mysql':
    target  => '/etc/beats/beats.yml',
    content => template('beats/protocols/protocols.database.erb'),
    order   => 12,
  }
}