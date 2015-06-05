class packetbeat::protocols::http (
  $http_ports = ['80', '8080', '8000'],
  $hide_keywords = undef,
  $send_headers = ['Host', 'Cookie'],
  $split_cookie = true,
  $real_ip_header = 'X-Forwarded-For'
) {
  concat::fragment {'protocols-http':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/protocols/protocols.http.erb'),
    order   => 11,
  }
}