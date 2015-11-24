define beats::outputs::elasticsearch (
  $hosts = ['localhost:9200'],
  $save_topology = true,
  $index = 'packetbeat',
  $outputs = $beats::outputs
) {
  concat::fragment {"${title}-output-elasticsearch":
    target  => "/etc/${title}/${title}.yml",
    content => template('beats/outputs/elasticsearch.erb'),
    order   => 21
  }
}