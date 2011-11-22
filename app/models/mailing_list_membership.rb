class MailingListMembership < ActiveRecord::Base
  establish_connection "mailman_#{RAILS_ENV}"
  set_table_name Radiant.config['reader.mailman.list_name']
  set_primary_key "address"
  before_create :set_defaults
  
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
      write_attribute(col, to_yesno(value))
    end
    define_method("#{col}_before_type_cast") do
      read_attribute(col) == 'Y' ? 1 : 0
    end
  end

private

  def set_defaults
    self.bi_lastnotice = 0
    self.bi_date = 0
    self.ack = true
  end

  def to_yesno(value)
    (value && value.to_i != 0) ? 'Y' : 'N'
  end
  
end