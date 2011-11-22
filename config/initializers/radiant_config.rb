Radiant.config do |config|
  config.namespace('reader.mailman') do |mm|
    mm.define 'list_name', :default => 'all'
  end
end 
