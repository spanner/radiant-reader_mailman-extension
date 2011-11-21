class ReaderMailmanExtension < Radiant::Extension
  version RadiantReaderMailmanExtension::VERSION
  description RadiantReaderMailmanExtension::DESCRIPTION
  url RadiantReaderMailmanExtension::URL
    
  def activate
    Reader.send :include, MailingListReader
    
    admin.account.edit.add :form, "accounts/mailing_list", :after => 'edit_password'
    admin.reader.edit.add :form, "admin/readers/mailing_list", :after => 'edit_group'
    admin.reader_configuration.show.add :settings, "admin/reader_configuration/mailing_list", :after => "administration"
    admin.reader_configuration.edit.add :form, "admin/reader_configuration/edit_mailing_list", :after => "administration"
  end
  
end
