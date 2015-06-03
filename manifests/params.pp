class packetbeat::params(
  $elasticsearch_host = 'localhost',
  $elasticsearch_port = '9200',
  $interfaces = 'any',
  $disable_procs = 'true',
  $agentname = $::fqdn ,
  $uid = '501',
  $gid = '501',
  $ensure = 'running',
  $enable = 'true',
  $snaplen = '1514',
  $sniffer_type = 'af_packet',
  $buffer_size = '100',
  $ignore_outgoing = 'false',
  $refresh_topology_freq = '15',
  $split_cookie = 'true'
){}
