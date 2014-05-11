define packetbeat::procs($procs,$cmdline)
{
  concat::fragment {"protocols-${procs}":
    target  => '/etc/packetbeat/packetbeat.conf',
    content => template('packetbeat/procs.conf.erb'),
    order   => 40,
  }
}



