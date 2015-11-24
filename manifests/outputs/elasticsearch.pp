class beats::outputs::elasticsearch (
  $hosts         = ['localhost'],
  $save_topology = true,
  $index         = 'packetbeat',
) {
  concat::fragment {"${title}-output-elasticsearch":
    target  => "/etc/${title}/${title}.yml",
    content => template('beats/outputs/elasticsearch.erb'),
    order   => 21
  }
}