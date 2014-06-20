Puppet::Type.newtype(:my_cnf) do
  @doc = "Manages the .my.cnf file"

  ensurable

  newparam(:username) do
    desc "Used to determine location of the file."

    isnamevar

  end

  newparam(:dbuser) do
    desc "Database user name."

  end

  newparam(:dbpass) do
    desc "Database password."

  end

  newparam(:dbhost) do
    desc "Database server."

  end

  newproperty(:replace) do
    desc "Force overwriting the file"

    defaultto :true
    newvalues(:true, :false)
  end

end
