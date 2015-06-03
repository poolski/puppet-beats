class packetbeat::package ($deburl = false, $version = '1.0.0~Beta1'){
  include ::apt

  apt::localpackage { 'packetbeat':
    url => $deburl ? {
      false   => "https://download.elasticsearch.org/beats/packetbeat/packetbeat_${version}_amd64.deb",
      default => $deburl
    }
  }

  package { 'libpcap0.8':
    ensure => installed
  }
  package { 'packetbeat':
    ensure  => installed,
    require => Apt::Localpackage['packetbeat']
  }
}
