class usercreate {
group { 'paul':
gid => 1111,
}

user { 'paul':
 			 ensure           => 'present',
       gid              => '1111',
       home             => '/home/paul',
       managehome		=> true,
	     groups			=> 'sudo',
       shell            => '/bin/bash',
       uid              => '1111',
     }
}
