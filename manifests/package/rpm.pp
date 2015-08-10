class packetbeat::package::rpm inherits packetbeat::package {


  package { 'libpcap':
    ensure => installed,
    before => Package['packetbeat']
  }
  package { 'packetbeat':
    ensure   => installed,
  }
}
