# Set-ExecutionPolicy unrestricted
# https://stackoverflow.com/questions/15528492/display-all-sites-and-bindings-in-powershell 

Foreach ($Site in get-website) { Foreach ($Bind in $Site.bindings.collection) { 
  [pscustomobject]@{name=$Site.name;Protocol=$Bind.Protocol;Bindings=$Bind.BindingInformation;
  path=$Site.physicalPath 
}}}
