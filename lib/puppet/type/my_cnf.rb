Puppet::Type.newtype(:my_cnf) do
  @doc = "Manages the .my.cnf file"

  ensurable do
    desc "Manage the content of .my.cnf file. Valid values are: present, absent."

    defaultto(:present)

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end

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

end
