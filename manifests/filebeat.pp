# Filebeat
class beats::filebeat (
  $ensure        = present,
  $idle_timeout  = '5s',
  $prospectors   = {},
  $registry_file = '/var/lib/filebeat/registry',
  $spool_size    = 1024,
){
  include beats::filebeat::config
  case $::osfamily {
    'Debian': {
      include ::apt::update

      package {'filebeat':
        ensure  => $ensure,
        require => Class['apt::update']
      }
    }
    'RedHat': {
      package {'filebeat':
        ensure  => $ensure,
      }
    }
    default: { fail("${::osfamily} not supported yet") }
  }
  service { 'filebeat':
    ensure => running,
    enable => true,
  }
  Package['filebeat'] -> Class['beats::filebeat::config'] ~>
  Service['filebeat']
}
