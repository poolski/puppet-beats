# Metricbeat class
class beats::metricbeat (
  $ensure           = present,
  $period           = 10,
  $procs            = ['.*'],
  $stats_system     = true,
  $stats_proc       = true,
  $stats_filesystem = true,
){

  case $::osfamily {
    'Debian': {
      include ::apt::update
      package {'metricbeat':
        ensure  => $ensure,
        require => Class['apt::update']
      }
    }
    'RedHat': {
      package {'metricbeat':
        ensure  => $ensure,
      }
    }
    default: { fail("${::osfamily} not supported yet") }
  }

  include beats::metricbeat::config

  service { 'metricbeat':
    ensure => running,
    enable => true,
  }

  Package['metricbeat'] -> Class['beats::metricbeat::config'] ~> Service['metricbeat']
}
