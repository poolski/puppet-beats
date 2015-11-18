class beats::protocols::pgsql (
  $protocol       = 'pgsql',
  $ports          = ['5432'],
  $max_rows       = undef,
  $max_row_length = undef
) {
  concat::fragment {'protocols-pgsql':
    target  => '/etc/beats/beats.yml',
    content => template('beats/protocols/protocols.database.erb'),
    order   => 13,
  }
}