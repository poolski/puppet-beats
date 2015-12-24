define beats::procs($proc,$cmdline)
{
  concat::fragment {"protocols-${proc}":
    target  => '/etc/beats/beats.yml',
    content => template('beats/procs.conf.erb'),
    order   => 31,
  }
}
