include 'docker'

docker::image { 'ubuntu':
   image_tag => 'trusty',
   ensure   => absent,
}

docker::run { 'helloworld':
  image   => 'ubuntu:precise',
  command => '/bin/sh -c "while true; do echo hello world; sleep 1; done"',
  remove_container_on_start => true,
  remove_volume_on_start    => false,
  remove_container_on_stop  => true,
  remove_volume_on_stop     => false,
  tty          => true,
  ensure   => absent,
}
