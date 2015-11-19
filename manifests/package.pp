class beats::package (
  $version = $beats::version,
){
  case $::osfamily {
    'Debian': {
      # Install pcap because it's useful and used in packetbeat
      package { 'libpcap0.8':
        ensure => installed,
      }

      if $beats::enable_packetbeat { contain ::beats::packetbeat }
      #if $beats::filebeat { 'filebeat' }
      #if $beats::topbeat { $components << 'topbeat' } 
    }
    default: { fail("${::osfamily} not supported yet") }
  }
}
