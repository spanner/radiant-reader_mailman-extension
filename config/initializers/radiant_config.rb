Radiant.config do |config|
  config.namespace('reader.mailman') do |mm|
    mm.define 'list_name', :default => 'all'
    mm.define 'username'
    mm.define 'password'
    mm.define 'host', :default => 'localhost'
    mm.define 'port', :default => '3306'
  end
end 
