class beats::config() {
  file { '/etc/beats/':
    ensure => 'directory',
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
  }

  if $beats::enable_packetbeat { contain beats::packetbeat::config }
}
