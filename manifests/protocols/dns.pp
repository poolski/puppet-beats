# DNS
class beats::protocols::dns (
  $ports    = ['53']
) {
  concat::fragment {'protocols-dns':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/protocols/protocols.dns.erb'),
    order   => 14,
  }
}