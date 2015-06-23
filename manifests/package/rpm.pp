class packetbeat::package::rpm inherits packetbeat::package {

  wget::fetch { 'packetbeat':
    source      => "https://download.elasticsearch.org/beats/packetbeat/packetbeat_${version}_${::architecture}.rpm",
    destination => "/tmp/packetbeat-${version}_${::architecture}.rpm",
    timeout     => 0,
    verbose     => false,
  }

  package { 'libpcap0.8':
    ensure => installed,
    before => Package['packetbeat']
  }
  package { 'packetbeat':
    ensure   => installed,
    provider => rpm,
    source   => "/tmp/packetbeat-${version}_${::architecture}.rpm",
    require  => Wget::Fetch['packetbeat']
  }
}