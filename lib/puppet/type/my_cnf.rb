Puppet::Type.newtype(:my_cnf) do
  @doc = "Manages the .my.cnf file"

  ensurable

end
