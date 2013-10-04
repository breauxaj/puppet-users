define users::add_ssh_key (
  $username,
  $key,
  $type
) {
  ssh_authorized_key { $name:
    ensure  => present,
    key     => $key,
    type    => $type,
    user    => $username,
    require => File["/home/${username}/.ssh/authorized_keys"],
  }

}
