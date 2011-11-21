class ReaderMailmanExtension < Radiant::Extension
  version RadiantReaderMailmanExtension::VERSION
  description RadiantReaderMailmanExtension::DESCRIPTION
  url RadiantReaderMailmanExtension::URL
    
  def activate
    Reader.send :include, MailingListReader
    
    admin.reader.edit.add :form, "mailing_list", :after => 'edit_group'
    admin.account.edit.add :form, "mailing_list", :after => 'edit_password'
    admin.reader.edit.add :form, "mailing_list", :before => 'edit_address'
    admin.reader_configuration.show.add :settings, "mailman", :after => "administration"
    admin.reader_configuration.edit.add :form, "mailman", :after => "administration"
  end
  
end
