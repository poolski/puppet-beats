class packetbeat::outputs::elasticsearch (
  $enabled = $packetbeat::es_enabled,
  $host = $packetbeat::es_host,
  $port = $packetbeat::es_port,
  $username = $packetbeat::es_username,
  $password = $packetbeat::es_password,
  $protocol = $packetbeat::es_protocol,
  $save_topology = $packetbeat::es_save_topology,
  $index = $packetbeat::es_index,
  $http_path = $packetbeat::es_http_path,
) {
  concat::fragment {'output.elasticsearch':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/outputs/elasticsearch.erb'),
    order   => 21
  }
}
