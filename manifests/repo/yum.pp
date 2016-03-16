# Placeholder for when there are official repos
class beats::repo::yum {

  rpmkey { 'd88e42b4':
    ensure => present,
    source => 'https://packages.elastic.co/GPG-KEY-elasticsearch',
  }

  yumrepo { 'elastic-beats':
    ensure   => 'present',
    baseurl  => 'https://packages.elastic.co/beats/yum/el/$basearch',
    descr    => 'Elastic Beats Repository',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'https://packages.elastic.co/GPG-KEY-elasticsearch',
    require  => Rpmkey['d88e42b4'],
  }


}

