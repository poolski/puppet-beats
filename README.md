# beats
Elastic libbeat puppet module
=======
License
-------
GPL v2

## WARNING ##

This module is still very experimental. Most things work most of the time, mostly.
Some protocols and settings are still missing.
*Minimally tested on Debian-flavour systems. No RedHat/CentOS support yet*

## Example Use ##

```
include ::beats
include ::beats::topbeat
include ::beats::filebeat
```

### Configuring using class parameters ###
```
class { '::beats':
  manage_repo  => false,
  manage_geoip => false,
  shipper_data => {
    shipper => {
      refresh_topology_freq => '200'
    }
  }
}
```

### Configuring using Hiera ###
```
"beats::filebeat::prospectors":
  "filebeat":
    "prospectors":
      - "fields":
          "type": "es_clusterlog"
          "cluster_name": "my-es-cluster"
        "paths":
          - "/var/log/elasticsearch/inst/*.log"
        "document_type": "es_clusterlog"
        "multiline":
          "pattern": '^\['
          "negate": true
          "match": "after"
      - "fields":
          "type": "es_slowlog"
          "cluster_name": "my-es-cluster"
        "paths":
          - "/var/log/elasticsearch/inst/*slowlog.log"
        "document_type": "es_slowlog"
        "multiline":
          "pattern": '^\['
          "negate": false
          "match": "after"
```

The ES output *should* work, but I've not tested it yet.
Some digging around inside the module will be necessary to make bits work.
