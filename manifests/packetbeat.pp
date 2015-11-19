class beats::packetbeat (){
  package {'packetbeat':
    ensure => $ensure,
  }
  service { 'packetbeat':
    ensure => running,
    enable => true,
  }
}