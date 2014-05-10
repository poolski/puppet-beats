class packetbeat::config(
  $host = 'localhost',
  $port = '9200',
  $interfaces = 'any',
  $disable_procs = 'true',
  $agentname = $::fqdn ,
  $uid = '501',
  $gid = '501',
){


  file { '/etc/packetbeat/':
    ensure => 'directory',
    group  => '0',
    mode   => '0755',
    owner  => '0',
  }

  file { '/etc/packetbeat/packetbeat.conf':
    content => template('packetbeat/packetbeat.conf.erb'),
    group   => '0',
    mode    => '0755',
    owner   => '0',
    notify  => Service['packetbeat']

  }

}

