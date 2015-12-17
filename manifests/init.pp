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
  $version               = '1.0.0-rc2',
  $ensure                = 'running',
  $enable                = true,
  $ignore_outgoing       = true,
  $refresh_topology_freq = '10',
  $topology_expire       = '15',
  $uid                   = undef,
  $gid                   = undef,
  $outputs_deep_merge    = false,
  $outputs_logstash      = {},
  $outputs_elasticsearch = {},
  $outputs_file          = {},
  $http_enabled          = true,
  $pgsql_enabled         = false,
  $mysql_enabled         = false,
  $redis_enabled         = false,
  $manage_geoip          = true,
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

  

  include beats::repo::apt, beats::package, beats::config
  Class['beats::repo::apt'] -> Class['beats::package'] -> Class['beats::config']
}
