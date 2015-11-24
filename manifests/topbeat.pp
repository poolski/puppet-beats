class beats::topbeat (
  $ensure           = present,
  $period           = 10,
  $procs            = [".*"]
  $stats_system     = true,
  $stats_proc       = true,
  $stats_filesystem = true,
){
  package {'topbeat':
    ensure => $ensure,
  }
  service { 'topbeat':
    ensure => running,
    enable => true,
  }
  include beats::topbeat::config
  Class['beats::topbeat::config'] ~> Service['topbeat']
}