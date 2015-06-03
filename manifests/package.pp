class packetbeat::package ($version = '1.0.0~Beta1'){
  package { 'packetbeat':
    ensure   => $version,
    provider => 'dpkg',
    source   => "https://download.elasticsearch.org/beats/packetbeat/packetbeat_${version}_amd64.deb"
  }
}
