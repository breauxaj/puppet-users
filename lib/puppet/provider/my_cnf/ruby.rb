Puppet::Type.type(:my_cnf).provide(:ruby) do
  desc "Manage the .my.cnf file"

  commands :cat => 'cat'

  def my_file(str)
    return File.expand_path("~" + str + "/.my.cnf" )
  end

  def create
    content = "[client]\nuser = " + @resource[:dbuser] + "\npassword = '" + @resource[:dbpass] + "'\nhost = " + @resource[:dbhost] + "\n"

    File.open(my_file(@resource[:name]), "w") do |file|
      file.puts(content)
    end

  end

  def destroy  
    cat(['/dev/null', '>', my_file(@resource[:name])])
  end

  def exists?
    ! File.zero?(my_file(@resource[:name]))
  end

end
