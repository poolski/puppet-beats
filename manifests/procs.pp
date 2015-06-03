define packetbeat::procs($procs,$cmdline)
{
  concat::fragment {"protocols-${procs}":
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/procs.conf.erb'),
    order   => 40,
  }
}



