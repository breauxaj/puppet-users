define users::add_my_cnf (
  $dbuser,
  $dbpass,
  $dbhost
) {
  if $name =~ /^root$/ {
    file { "/${name}/.my.cnf":
      ensure  => present,
      owner   => 0,
      group   => 0,
      mode    => '0600',
    }

    my_cnf { $name:
      ensure   => present,
      dbuser   => $dbuser,
      dbpass   => $dbpass,
      dbhost   => $dbhost,
      require  => File["/${name}/.my.cnf"],
    }

  } else {
    my_cnf { $name:
      ensure   => present,
      dbuser   => $dbuser,
      dbpass   => $dbpass,
      dbhost   => $dbhost,
      require  => File["/home/${name}/.my.cnf"],
    }

  }

}
