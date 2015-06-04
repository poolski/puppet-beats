define packetbeat::procs($proc,$cmdline)
{
  concat::fragment {"protocols-${proc}":
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/procs.conf.erb'),
    order   => 31,
  }
}
