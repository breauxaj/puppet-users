Puppet::Type.newtype(:my_cnf) do
  @doc = "Manages the .my.cnf file"

  ensurable

  newparam(:name) do
    desc ""

    isnamevar

  end

  newproperty(:user) do
    desc "The user account in which the SSH key should be installed.
    The resource will automatically depend on this user."
  end

  autorequire(:user) do
    should(:user) if should(:user)
  end

end
