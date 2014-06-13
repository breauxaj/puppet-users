require 'fileutils'

Puppet::Type.type(:my_cnf).provide(:ruby) do
  desc "Manage the .my.cnf file"

  commands :cat => 'cat'

  filename = "/home/" + resource[:name] + "/.my.cnf"

  def create
    content = "[client]\nuser = " + resource[:dbuser] + "\npassword = \"" + resource[:dbpass] + "\"\nhost = " + resource[:dbhost] + "\n"

    File.open(filename, "wb") do |file|
      file.write(content)
    end

  end

  def destroy
    cat(['/dev/null', filename])
  end

  def exists?
    File.zero?(filename)
  end

  autorequire(:file) do
    ["/home", filename]
  end

end
