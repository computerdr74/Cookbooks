Chef::Log.info("******Creating a data directory.******")

directory 'C:\data' do
  rights :full_control, 'WORKGROUP\admin'
  inherits false
  action :create
end