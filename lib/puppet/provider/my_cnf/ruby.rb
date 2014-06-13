Puppet::Type.type(:my_cnf).provide(:ruby) do
  desc "Manage the .my.cnf file"

  commands :cat => 'cat'

  filename = "/home/" + @resource[:name] + "/.my.cnf"

  def create
    content = "[client]\nuser = " + @resource[:dbuser] + "\npassword = \"" + @resource[:dbpass] + "\"\nhost = " + @resource[:dbhost] + "\n"

    File.open(filename, "w") do |file|
      file.puts(content)
    end

  end

  def destroy
    cat(['/dev/null', '>', filename])
  end

  def exists?
    File.zero?(filename)
  end

  autorequire(:file) do
    [filename]
  end

end
