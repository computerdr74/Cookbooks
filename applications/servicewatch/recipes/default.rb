if platform?("windows")
    windows_package "ServiceWatch" do
        source node['servicewatch']['http_url']
        installer_type :custom
        options "/S"
        action :install
    end
else
  Chef::Log.warn('ServiceWatch can only be installed on the Windows platform.')
end