class packetbeat::outputs::elasticsearch (
  $host = $packetbeat::elasticsearch_host,
  $port = $packetbeat::elasticsearch_port,
  $username = undef,
  $password = undef,
  $protocol = undef,
  $save_topology = false,
  $index = undef,
  $http_path = undef,
) {
  concat::fragment {'output.elasticsearch':
    target  => '/etc/packetbeat/packetbeat.yml',
    content => template('packetbeat/outputs/elasticsearch.erb'),
    order   => 21
  }
}
