define users::add_group (
  $gid
) {
  group { $name:
    ensure => present,
    gid    => $gid,
  }

}
