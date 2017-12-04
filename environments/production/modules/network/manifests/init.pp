class network::config {
        file {'/etc/hosts':
          owner  => 'root',
          group  => 'root',
          mode   => '0644',
          content=> template("/etc/puppetlabs/code/environments/production/modules/bind/templates/hosts.erb"),
          }

        file {'/etc/resolv.conf':
          owner  => 'root',
          group  => 'root',
          mode   => '0644',
          content=> template("/etc/puppetlabs/code/environments/production/modules/bind/templates/resolv.conf.erb"),
  				}
      }

class network {
        include network::config
          }
