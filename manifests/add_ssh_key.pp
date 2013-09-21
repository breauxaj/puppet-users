define users::add_ssh_key (
  $key,
  $type
) {
  ssh_authorized_key { $name:
    ensure  => present,
    key     => $key,
    type    => $type,
    user    => $name,
    require => File["/home/${name}/.ssh/authorized_keys"],
  }

}
