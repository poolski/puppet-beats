define packetbeat::protocols($protocol,$ports)
{
  concat::fragment {"protocols-${protocol}":
    target  => '/etc/packetbeat/packetbeat.conf',
    content => template('packetbeat/protocols.conf.erb'),
    order   => 20,
  }
}
