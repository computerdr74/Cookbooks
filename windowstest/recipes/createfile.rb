Chef::Log.info("******Creating a file.******")

file 'C:\hello.txt' do
  content 'Welcome to Chef'
end
