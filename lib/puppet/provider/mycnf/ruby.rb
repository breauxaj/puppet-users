Puppet::Type.type(:mycnf).provide(:ruby) do
  desc "Create a .my.cnf file"

  def create
    
  end

  def destroy
    FileUtils.rm_rf 
  end

  def exists?
    File.directory? 
  end

end
