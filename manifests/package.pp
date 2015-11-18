class beats::package (
	$version = $beats::version,
	$components = $beats::components,
	){
	case $::osfamily {
		'Debian': {
			# Install pcap because it's useful and used in packetbeat
			package { 'libpcap0.8':
				ensure => installed,
			}

			# Build the Components hash. 
			$components = []
			if $beats::packetbeat { $components << 'packetbeat' }
			if $beats::filebeat { $components << 'filebeat' }
			if $beats::topbeat { $components << 'topbeat' }

			# Iterate over components and install each
			$components.each | String $component| {
				beats::package::apt {$component:}
			} 
		}
		default: { fail("${::osfamily} not supported yet") }
	}
}
