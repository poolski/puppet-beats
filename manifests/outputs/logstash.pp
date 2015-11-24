class beats::outputs::logstash (
  $hosts = ["localhost:5044"],
  $index = $title,
  $worker = 2,
  $loadbalance = false,
) {
  concat::fragment {"${title}-output-logstash":
    target  => "/etc/${title}/${title}.yml",
    content => template('beats/outputs/logstash.erb'),
    order   => 22
  }
}