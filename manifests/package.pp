# Install beats packages
class beats::package (
  $version = $beats::version,
){
  case $::osfamily {
    'Debian': {
      # Install pcap because it's useful and used in packetbeat
      package { 'libpcap0.8':
        ensure => installed,
      }
    }
    default: { fail("${::osfamily} not supported yet") }
  }
  if $beats::manage_geoip {
    case $::lsbdistid {
      'Ubuntu': {
        package { 'geoip-database-contrib':
          ensure => latest,
        }
      }
      'Debian': {
        package { 'geoip-database-extra':
          ensure => latest,
        }
      }
      default: { fail("${::osfamily} not supported yet") }
    }
  }
}
