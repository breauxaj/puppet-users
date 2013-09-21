define users::add_service (
  $gid,
  $groups,
  $uid,
  $home = '/var/lib'
) {
  user { $name:
    ensure     => present,
    comment    => '',
    gid        => $gid,
    groups     => $groups,
    home       => "${home}/${name}",
    shell      => '/sbin/nologin',
    managehome => true,
    uid        => $uid,
  }

}
