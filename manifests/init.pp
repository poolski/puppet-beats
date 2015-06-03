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
  $elasticsearch_host = $packetbeat::params::elasticsearch_host,
  $elasticsearch_port = $packetbeat::params::elasticsearch_port,
  $interfaces = $packetbeat::params::interfaces,
  $agentname = $packetbeat::params::agentname,
) inherits packetbeat::params {

  include packetbeat::package, packetbeat::config, packetbeat::service
  Class['packetbeat::package'] -> Class['packetbeat::config'] ~> Class'packetbeat::service']
}
