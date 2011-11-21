class MailingListPreferences < ActiveRecord::Migration
  def self.up
    add_column :readers, :opt_out_of_mailing_list, :boolean
    add_column :readers, :mailing_list_digested, :boolean
    add_column :readers, :mailing_list_notmetoo, :boolean
    add_column :readers, :mailing_list_nomail, :boolean
  end

  def self.down
    remove_column :readers, :opt_out_of_mailing_list
    remove_column :readers, :mailing_list_digested
    remove_column :readers, :mailing_list_notmetoo
    remove_column :readers, :mailing_list_nomail
  end
end