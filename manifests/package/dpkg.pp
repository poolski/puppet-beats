class packetbeat::package::dpkg {

  wget::fetch { 'packetbeat':
    source      => "https://download.elasticsearch.org/beats/packetbeat/packetbeat_${version}_${::architecture}.deb",
    destination => "/tmp/packetbeat-${version}_${::architecture}.deb",
    timeout     => 0,
    verbose     => false,
  }

  package { 'libpcap0.8':
    ensure => installed,
    before => Package['packetbeat']
  }
  package { 'packetbeat':
    ensure   => installed,
    provider => dpkg,
    source   => "/tmp/packetbeat-${version}_${::architecture}.deb",
    require  => Wget::Fetch['packetbeat']
  }
}