# == Class: packetbeat
#
# Module to deploy PacketBeat
#
# === Parameters
#
#
# === Variables
#
# === Examples
#
#  class { packetbeat:
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
class packetbeat (
  $agentname = $::fqdn ,
  $ensure = 'running',
  $enable = true,
  $uid = '501',
  $gid = '501',
  $disable_procs = true,
  $refresh_topology_freq = '10',
  $topology_expire = '15',
  $ignore_outgoing = false,
  $interfaces = 'any',
  $int_snaplen = '1514',
  $int_sniffer_type = 'af_packet',
  $int_buffer_size = '100',
  $agentname = $::fqdn,
  $es_enabled = true,
  $es_host = 'localhost',
  $es_port = '9200',
  $es_username = undef,
  $es_password = undef,
  $es_protocol = undef,
  $es_save_topology = false,
  $es_index = undef,
  $es_http_path = undef,
  $redis_enabled = false,
  $redis_host = 'localhost',
  $redis_port = '6379',
  $redis_reconnect_interval = '1',
  $redis_save_topology = false,
  $redis_db_topology = '1',
  $redis_password = '',
  $redis_timeout = '5',
  $redis_index = 'packetbeat',
  $redis_db = '0',
  $file_enabled = false,
  $file_path = '/var/log/'
) {
  include packetbeat::package, packetbeat::config, packetbeat::service
  Class['packetbeat::package'] -> Class['packetbeat::config'] ~> Class['packetbeat::service']
}
