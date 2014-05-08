class packetbeat::package ($version = 'latest'){
  package { 'packetbeat':
    ensure => $version,
  }

}


