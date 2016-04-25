# Basic config common to all beats
class beats::config() {
  file { '/etc/beats/':
    ensure => 'directory',
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
  }
}
