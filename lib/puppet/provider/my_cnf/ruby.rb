Puppet::Type.type(:my_cnf).provide(:ruby) do
  desc "Manage the .my.cnf file"

  commands :cat => 'cat'

  def create
    content = "[client]\nuser = " + @resource[:dbuser] + "\npassword = '" + @resource[:dbpass] + "'\nhost = " + @resource[:dbhost] + "\n"
    
    filename = "/home/" + @resource[:name] + "/.my.cnf"

    File.open(filename, "w") do |file|
      file.puts(content)
    end

  end

  def destroy
    filename = "/home/" + @resource[:name] + "/.my.cnf"
  
    cat(['/dev/null', '>', filename])
  end

  def exists?
    filename = "/home/" + @resource[:name] + "/.my.cnf"
  
    ! File.zero?(filename)
  end

end
