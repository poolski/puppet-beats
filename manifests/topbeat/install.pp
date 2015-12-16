class beats::topbeat::install {
  package {'topbeat':
    ensure => $beats::topbeat::ensure,
    require => Class['apt::update']
  }
  service { 'topbeat':
    ensure => running,
    enable => true,
  }
}