require 'digest/md5'

Puppet::Type.type(:my_cnf).provide(:ruby) do
  desc "Manage the .my.cnf file"

  def my_cnf_file(str)
    return File.expand_path("~" + str + "/.my.cnf" )
  end

  def create
    content = "[client]\nuser = " + @resource[:dbuser] + "\npassword = '" + @resource[:dbpass] + "'\nhost = " + @resource[:dbhost] + "\n"

    File.open(my_cnf_file(@resource[:name]), "w") do |file|
      file.puts(content)
    end
  end

  def destroy
    File.truncate(my_cnf_file(@resource[:name]), 0)
  end

  def exists?
    content = "[client]\nuser = " + @resource[:dbuser] + "\npassword = '" + @resource[:dbpass] + "'\nhost = " + @resource[:dbhost] + "\n"
    n = Digest::MD5.hexdigest(content)
    c = Digest::MD5.hexdigest(IO.read(my_cnf_file(@resource[:name])))

    if c <=> n
      return true
    else
      return false
    end
  end

end
