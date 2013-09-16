users
=====

Encapsulate the functionality to simplify user/service/root account management.

Samples
-------
```
include users
```
```
users::add_group { 'deploy': gid => 500 }
users::add_user { 'deploy': fullname => 'Deploy', gid => '500', groups => 'deploy', password => '', uid => '500' }
```
```
users::set_root_password { 'default': password => '' }
```
