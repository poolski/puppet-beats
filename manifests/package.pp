class packetbeat::package ($deburl = false, $version = '1.0.0~Beta1'){
  include ::apt

  apt::localpackage { 'packetbeat':
    url => $deburl ? {
      false   => "https://download.elasticsearch.org/beats/packetbeat/packetbeat_${version}_amd64.deb",
      default => $deburl
    }
  }

  package { 'packetbeat':
    ensure  => $version,
    require => Apt::Localpackage['packetbeat']
  }
}
