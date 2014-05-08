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
class packetbeat {

  include packetbeat::package
  include packetbeat::config
  include packetbeat::service

}
