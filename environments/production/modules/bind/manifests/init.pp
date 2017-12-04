
class bind::update {
        exec { 'apt-update': command => '/usr/bin/apt-get update', # command this resource will run
        }
}

#class bind::install {
#        package { "bind9":
#          ensure => latest,
#        }
#}

class bind::installed {                       # install bind9 package
        package { 'bind9':
          #require => Exec['apt-update'],        # require 'apt-update' before installing
          ensure => installed,
          require=> Class["bind::update"],
        }
}

class bind::config {
        file { '/etc/bind/named.conf.local':
          ensure => present,
          mode => '0644',
          owner => 'root',
          group => 'bind',
          source => "file:/etc/puppetlabs/code/environments/production/modules/bind/files/named.conf.local",
          require=> Class["bind::installed"],
          }

        file { '/etc/bind/named.conf.options':
          ensure => present,
          mode => '0644',
          owner => 'root',
          group => 'bind',
          source => "file:/etc/puppetlabs/code/environments/production/modules/bind/files/named.conf.options",
          require=> Class["bind::installed"],
          }

        file { '/var/cache/bind/db.univ-perp.fr':
          ensure => present,
          mode => '0644',
          owner => 'root',
          group => 'bind',
          source => "file:/etc/puppetlabs/code/environments/production/modules/bind/files/db.univ-perp.fr",
          require=> Class["bind::installed"],
          }

        file { '/var/cache/bind/rev.univ-perp.fr':
          ensure => present,
          mode => '0644',
          owner => 'root',
          group => 'bind',
          source => "file:/etc/puppetlabs/code/environments/production/modules/bind/files/rev.univ-perp.fr",
          require=> Class["bind::installed"],
          }

        file {'/etc/resolv.conf':
          owner  => 'root',
          group  => 'root',
          mode   => '0644',
          content=> template("/etc/puppetlabs/code/environments/production/modules/bind/templates/resolv.conf.erb"),
          require=> Class["bind::installed"],
  				notify => Class["bind::service"],
  				}
      }

class bind::service {                             # ensure bind9 service is running
        service { 'bind9':
          ensure => running,
          }
}

class bind {
        include bind::update, bind::installed, bind::config, bind::service
          }
