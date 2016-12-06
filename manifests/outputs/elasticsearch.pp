# Define beats::outputs::elasticsearch
# Sets up ES outputs. If there's more than one...
define beats::outputs::elasticsearch (
  $hosts = ['localhost:9200'],
  $save_topology = true,
  $index = $title,
  $username = '',
  $password = '',
  $http_path = '',
  $outputs = $beats::outputs,
  $period = '10'
) {
  concat::fragment {"${title}-output-elasticsearch":
    target  => "/etc/${title}/${title}.yml",
    content => template('beats/outputs/elasticsearch.erb'),
    order   => 21,
  }
}
