class packetbeat::service(
  $enable = $packetbeat::enable,
  $ensure = $packetbeat::ensure,
) {

  service { 'packetbeat':
    ensure => $ensure,
    enable => $enable,
  }
}
