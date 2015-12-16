class beats::topbeat (
  $ensure           = present,
  $period           = 10,
  $procs            = [".*"],
  $stats_system     = true,
  $stats_proc       = true,
  $stats_filesystem = true,
){
  include ::apt::update
  include beats::topbeat::install
  include beats::topbeat::config
  Class['beats::topbeat::install'] -> Class['beats::topbeat::config'] ~> Service['topbeat']
}