# Setup the official repo
class beats::repo::apt() {
  apt::source { 'elastic-beats':
    comment  => 'Official Elastic beats repositories',
    location => 'https://packages.elastic.co/beats/apt',
    release  => 'stable',
    repos    => 'main',
    key      => {
      id     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
      server => 'pgp.mit.edu',
    },
    include  => {
      'deb'  => true,
    },
  }
  exec {'apt-get update':
    command => 'apt-get -qq update',
    path    => '/usr/bin',
    unless  => ['/usr/bin/dpkg -l | /bin/grep apt-transport-https'],
  }
  package {'apt-transport-https':
    ensure  => latest,
    before  => Apt::Source['elastic-beats'],
    require => Exec['apt-get update'],
  }
}