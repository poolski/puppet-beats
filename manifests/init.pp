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
  $ignore_outgoing       = true,
  $version               = '1.0.0-rc2',
  $refresh_topology_freq = '10',
  $topology_expire       = '15',
  $managerepo            = true,
  $ensure                = 'running',
  $enable                = true,
  $uid                   = undef,
  $gid                   = undef,
){
  include beats::repo, beats::package, beats::config
  Class['beats::repo'] -> Class['beats::package'] -> Class['beats::config']
}
