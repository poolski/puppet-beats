class packetbeat::package ($deburl = false, $version = '1.0.0~Beta1'){
  include ::wget

  wget::fetch { 'https://download.elasticsearch.org/beats/packetbeat/packetbeat_${version}_amd64.deb':
    destination => "'/tmp/packetbeat-${version}.deb",
    timeout     => 0,
    verbose     => false,
  }

  package { 'libpcap0.8':
    ensure => installed
  }
  package { 'packetbeat':
    provider => dpkg,
    ensure   => installed,
    source   => "/tmp/packetbeat-${version}.deb"
  }
}
