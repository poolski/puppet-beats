class packetbeat::package::dpkg inherits packetbeat::package{

  wget::fetch { 'packetbeat':
    source      => "https://download.elasticsearch.org/beats/packetbeat/packetbeat_${packetbeat::package::version}_${::architecture}.deb",
    destination => "/tmp/packetbeat-${packetbeat::package::version}_${::architecture}.deb",
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
    source   => "/tmp/packetbeat-${packetbeat::package::version}_${::architecture}.deb",
    require  => Wget::Fetch['packetbeat']
  }
}
