node default { }

#node 'puppetclient' {
#include usercreate
#}

node 'puppetclient' {
$param1 = 'univ-perp.fr'
$dns1 = '10.0.0.71'
include bind
}
