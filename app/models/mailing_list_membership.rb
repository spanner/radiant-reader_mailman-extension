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
  
  [:digest, :not_metoo, :nomail, :plain].each do |col|
    define_method(col) do
      read_attribute(col) == 'Y'
    end
    define_method("#{col}=") do |value|
      write_attribute(col, (!!value ? 'Y' : 'N'))
    end
  end
  
end