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
  $tags                  = [],
  $version               = 'latest',
  $ensure                = 'running',
  $enable                = true,
  $ignore_outgoing       = true,
  $refresh_topology_freq = '10',
  $topology_expire       = '15',
  $uid                   = undef,
  $gid                   = undef,
  $outputs_deep_merge    = true,
  $outputs_logstash      = {},
  $outputs_elasticsearch = {},
  $outputs_file          = {},
  $http_enabled          = true,
  $pgsql_enabled         = false,
  $mysql_enabled         = false,
  $redis_enabled         = false,
  $manage_geoip          = true,
  $manage_repo           = true,
){

  if $outputs_deep_merge {
    $_outputs_logstash = hiera_hash('beats::outputs_logstash',{})
    $_outputs_elasticsearch = hiera_hash('beats::outputs_elasticsearch',{})
    $_outputs_file = hiera_hash('beats::outputs_file',{})
  }
  else {
    $_outputs_logstash = $outputs_logstash
    $_outputs_elasticsearch = $outputs_elasticsearch
    $_outputs_file = $outputs_file
  }

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
}
