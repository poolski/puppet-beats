# Placeholder for when there are official repos
class beats::repo::yum {

  rpmkey { '52371eca':
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
    require  => Rpmkey['52371eca'],
  }


}

