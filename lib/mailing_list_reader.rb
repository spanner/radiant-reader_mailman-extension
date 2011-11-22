module MailingListReader  # for inclusion into Reader
  def self.included(base)
    base.class_eval do
      has_one :mailing_list_membership, :primary_key => 'email', :foreign_key => 'address', :dependent => :destroy
      accepts_nested_attributes_for :mailing_list_membership
    end
  end
end
