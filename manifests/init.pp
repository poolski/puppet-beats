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
  $enable_packetbeat     = true,
  $enable_filebeat       = false,
  $enable_topbeat        = false,
  $tags                  = [],
  $ensure                = 'running',
  $enable                = true,
  $uid                   = undef,
  $gid                   = undef,
  $disable_procs         = true,  
  $managerepo            = true,
  $version               = '1.0.0-rc2',
  $refresh_topology_freq = '10',
  $topology_expire       = '15',
  $ignore_outgoing       = true,
  $es_enabled            = true,
  $es_host               = 'localhost',
  $es_port               = '9200',
  $es_username           = undef,
  $es_password           = undef,
  $es_protocol           = undef,
  $es_save_topology      = true,
  $es_index              = undef,
  $es_http_path          = undef,
) {
  include beats::package, beats::config
  if $managerepo  {
    include beats::repo
  }
  Class['beats::package'] -> Class['beats::config']

}
