class packetbeat::package::rpm inherits packetbeat::package {


  package { 'libpcap':
    ensure => installed,
    before => Package['packetbeat']
  }
  package { 'packetbeat':
    ensure   => installed,
    provider => rpm,
    source   => "https://download.elasticsearch.org/beats/packetbeat/packetbeat-${version}-${::architecture}.rpm",
  }
}
