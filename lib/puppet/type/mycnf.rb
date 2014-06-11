Puppet::Type.newtype(:mycnf) do
  @doc = "Manage the .my.cnf configuration."

  ensurable
  
  newparam(:name) do
    desc "Not used"

    isnamevar

  end
 
  newparam(:dbuser) do
    desc "Database user"

  end

  newparam(:dbpass) do
    desc "Database password"

  end

  newparam(:dbpass) do
    desc "Database password"

  end

  newparam(:dbhost) do
    desc "Database server host"

  end

end
