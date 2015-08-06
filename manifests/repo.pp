class packetbeat::repo {


  case $::osfamily {

    'Debian': {
      class { 'packetbeat::repo::apt': }
    }

    'RedHat': {
      class { 'packetbeat::repo::yum': }
    }

    default: { fail("${::osfamily} not supported yet") }

  }
}
