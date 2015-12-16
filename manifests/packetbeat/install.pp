class beats::packetbeat::install {
  package {'packetbeat':
    ensure  => $beats::packetbeat::ensure,
    require => Class['apt::update']
  }
  service { 'packetbeat':
    ensure => running,
    enable => true,
  }
}