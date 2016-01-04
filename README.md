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

### Supported components ###

This module currently supports the following inputs:
* Packetbeat
* Filebeat
* Topbeat
and the following outputs:
* Elasticsearch
* Logstash

## Example Use ##

```
include ::beats
include ::beats::topbeat
include ::beats::filebeat
```

### Hiera ###
```
"beats::filebeat::prospectors": {
  "syslog": {
    "fields": {
      "type": "syslog"
    },
    "paths": [
      "/var/log/syslog"
    ]
  }
},
"beats::outputs_deep_merge": true,
"beats::outputs_logstash": {
  "filebeat": {
    "hosts": [
      "localhost:5044"
    ]
  },
  "topbeat": {
    "hosts": [
      "localhost:5044"
    ]
  }
}
```

The reason for the weird duplication for the outputs block is that it's the only way I could ensure that Hiera would correctly deep merge outputs. 

The ES output *should* work, but I've not tested it yet. 
Some digging around inside the module will be necessary to make bits work.
