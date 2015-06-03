class packetbeat::outputs::elasticsearch (
  $host = $packetbeat::elasticsearch_host,
  $port = $packetbeat::elasticsearch_port,
) {
  concat::fragment {'output.elasticsearch':
    target  => '/etc/packetbeat/packetbeat.conf',
    content => template('packetbeat/outputs/elasticsearch.erb'),
    order   => 21
  }
}
