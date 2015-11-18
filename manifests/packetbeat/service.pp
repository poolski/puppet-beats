class beats::packetbeat::service () {
	service { 'packetbeat':
    	ensure => running,
    	enable => true,
  	}
}
  	