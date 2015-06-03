class packetbeat::protocols::http (
  $http_ports = '80, 8080, 8000',
  $hide_keywords = [],
  $send_headers = ["Host", "Cookie", "X-Forwarded-For"],
  $split_cookie = true,
  $real_ip_header = "X-Forwarded-For"
) {
  concat::fragment {"protocols-http":
    target  => '/etc/packetbeat/packetbeat.conf',
    content => template('packetbeat/protocols/protocols.http.erb'),
    order   => 20,
  }
}