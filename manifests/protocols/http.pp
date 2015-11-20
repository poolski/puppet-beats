class beats::protocols::http (
  $http_ports     = $beats::packetbeat::config::http_ports,
  $hide_keywords  = $beats::packetbeat::config::http_hide_keywords,
  $send_headers   = $beats::packetbeat::config::http_send_headers,
  $split_cookie   = $beats::packetbeat::config::http_split_cookie,
  $real_ip_header = $beats::packetbeat::config::http_real_ip_header
) {
  concat::fragment {'protocols-http':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('beats/protocols/protocols.http.erb'),
    order   => 11,
  }
}