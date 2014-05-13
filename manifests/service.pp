class packetbeat::service(
  $enable = $packetbeat::service::enable,
  $ensure = $packetbeat::service::ensure,
) {

  service { 'packetbeat':
    ensure => "$ensure",
    enable => $enable,
  }


}

