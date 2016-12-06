# Packetbeat class
class beats::packetbeat (
  $ensure                    = present,
  $interfaces                = 'any',
  $int_snaplen               = undef,
  $int_sniffer_type          = undef,
  $int_buffer_size           = undef,
  $http_enabled              = $beats::http_enabled,
  $mysql_enabled             = $beats::mysql_enabled,
  $pgsql_enabled             = $beats::pgsql_enabled,
  $redis_enabled             = $beats::redis_enabled,
  $http_ports                = ['80', '8080', '8000'],
  $http_hide_keywords        = [],
  $http_send_headers         = ['Host'],
  $http_split_cookie         = true,
  $http_real_ip_header       = 'X-Forwarded-For',
  $http_redact_authorization = false,
  $mysql_protocol            = 'mysql',
  $mysql_ports               = ['3306'],
  $mysql_max_rows            = undef,
  $mysql_max_row_length      = undef,
  $pgsql_protocol            = 'pgsql',
  $pgsql_ports               = ['5432'],
  $pgsql_max_rows            = undef,
  $pgsql_max_row_length      = undef,
){
  include ::beats::packetbeat::config

  case $::osfamily {
    'Debian': {
      include ::apt::update
      package {'packetbeat':
        ensure  => $beats::packetbeat::ensure,
        require => Class['apt::update'],
      }
    }
    'RedHat': {
      package {'packetbeat':
        ensure  => $beats::packetbeat::ensure,
      }
    }
    default: { fail("${::osfamily} not supported yet") }
  }
  case $beats::packetbeat::ensure {
    'absent','purged': {
      service { 'packetbeat':
        ensure => 'stopped',
        enable => false,
      }
    }
    default: {
      service { 'packetbeat':
        ensure => running,
        enable => true,
      }
      Package['packetbeat'] -> Class['beats::packetbeat::config'] ~> Service['packetbeat']
    }
  }
}
