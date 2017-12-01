node default { }

#node 'puppetclient' {
#include usercreate
#}

node 'puppetclient' {
include bind
}
