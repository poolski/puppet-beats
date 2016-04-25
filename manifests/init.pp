# == Class: beats
#
# Module to deploy beats
#
# === Parameters
#
#
# === Variables
#
# === Examples
#
#  class { beats:
#  }
#
# === Authors
#
# @poolski (github)
#
# === Copyright
#
# GPLv2
#
class beats (
  $agentname             = $::fqdn ,
  $tags                  = undef,
  $version               = 'latest',
  $ensure                = 'running',
  $enable                = true,
  $ignore_outgoing       = true,
  $refresh_topology_freq = '10',
  $topology_expire       = '15',
  $uid                   = undef,
  $gid                   = undef,
  $http_enabled          = true,
  $pgsql_enabled         = false,
  $mysql_enabled         = false,
  $redis_enabled         = false,
  $geoip_paths           = undef,
  $manage_geoip          = true,
  $manage_repo           = true,
  $shipper_data          = {}
){
  if ($manage_repo == true) {
    case $::osfamily {
      'RedHat': {
        include beats::repo::yum, beats::package, beats::config
        Class['beats::repo::yum'] -> Class['beats::package'] -> Class['beats::config']
      }
      'Debian': {
        include beats::repo::apt, beats::package, beats::config
        Class['beats::repo::apt'] -> Class['beats::package'] -> Class['beats::config']
      }
      default: { fail("${::osfamily} not supported yet") }
    }
  }
  else {
    case $::osfamily {
      'RedHat': {
        include  beats::package, beats::config
        Class['beats::package'] -> Class['beats::config']
      }
      'Debian': {
        include beats::package, beats::config
        Class['beats::package'] -> Class['beats::config']
      }
      default: { fail("${::osfamily} not supported yet") }
    }
  }
}
