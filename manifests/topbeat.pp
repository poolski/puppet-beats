# Topbeat class
class beats::topbeat (
  $ensure           = present,
  $period           = 10,
  $procs            = ['.*'],
  $stats_system     = true,
  $stats_proc       = true,
  $stats_filesystem = true,
){

  include ::beats::topbeat::config

  case $::osfamily {
    'RedHat': {
      package {'topbeat':
        ensure  => $ensure,
        require => Yumrepo['elastic-beats'],
      }
    }
    default: {
      include ::apt::update

      package {'topbeat':
        ensure  => $ensure,
        require => Class['apt::update'],
      }
    }
  }

  service { 'topbeat':
    ensure => running,
    enable => true,
  }

  Package['topbeat'] -> Class['beats::topbeat::config'] ~> Service['topbeat']
}