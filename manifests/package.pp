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

      if $beats::manage_geoip {
        package { 'geoip-database-contrib':
          ensure => latest,
        }
      }
    }
    'RedHat': {
      package { 'libpcap':
        ensure => installed,
      }

      if $beats::manage_geoip {
        package { 'GeoIP':
          ensure => latest,
        }
      }
    }
    default: { fail("${::osfamily} not supported yet") }
  }
}
