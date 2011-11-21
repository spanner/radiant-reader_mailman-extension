class MailingListMembership < ActiveRecord::Base
  establish_connection "mailman_#{RAILS_ENV}"
  set_table_name Radiant.config['reader.mailman.list_name']
  set_primary_key "address"
  
  def self.of_list(listname)
    old_table_name = self.table_name
    set_table_name listname
    reset_column_information
    self
  end
  
  def exist?(address)
    !!self.find_by_id(address)
  end
  
end