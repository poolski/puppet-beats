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
  $outputs_logstash      = {},
  $outputs_elasticsearch = {},
  $outputs_file          = {},
){
  include beats::repo::apt, beats::package, beats::config
  Class['beats::repo'] -> Class['beats::package'] -> Class['beats::config']
}
