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
# Kris Buytaert <kris@inuits.eu>
#
# === Copyright
#
# GPLv2
#
class packetbeat (
  $host = $packetbeat::params::host,
  $port = $packetbeat::params::port,
  $interfaces = $packetbeat::params::interfaces,
  $disable_procs = $packetbeat::params::disable_procs,
  $agentname = $packetbeat::params::agentname ,
  $uid = $packetbeat::params::uid,
  $gid = $packetbeat::params::gid,
) inherits packetbeat::params {

  include packetbeat::package
  include packetbeat::config
  include packetbeat::service

}
