class usercreate {
user { 'paul':
 			 ensure           => 'present',
       gid              => '501',
       home             => '/home/paul',
       managehome		=> true,
	     groups			=> 'sudo'
       password         => 'UuM7JVEHp6NrJ14xWyv6DFCgmbca_kT1PCZl5QCrrGe6oHAdvOvEnReQOfp3',
       password_max_age => '99999',
       password_min_age => '0',
       shell            => '/bin/bash',
       uid              => '501',
     }
}
