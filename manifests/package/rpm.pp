class beats::package::rpm inherits beats::package {


  package { 'libpcap':
    ensure => installed,
    before => Package['beats']
  }
  package { 'beats':
    ensure   => installed,
  }
}
