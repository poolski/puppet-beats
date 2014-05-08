class packetbeat::service {

  service { 'packetbeat':
    ensure => 'running',
    enable => 'true',
  }


}

