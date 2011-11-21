module MailingListReader  # for inclusion into Reader

  def self.included(base)
    base.class_eval do
      has_one :mailing_list_membership, :primary_key => 'email', :foreign_key => 'address', :dependent => :destroy

      include InstanceMethods
      after_create :create_list_membership
      before_update :update_list_membership
    end
  end

  module InstanceMethods
    def create_list_membership
      unless self.opt_out_of_mailing_list?
        self.create_mailing_list_membership(:name => name, :ack => 'Y', :bi_date => 0, :bi_lastnotice => 0)
      end
    end

    def update_list_membership
      if reader.opts_out_of_mailing_list?
        mailing_list_membership.destroy
      else
        mailing_list_membership ||= create_list_membership
        mailing_list_membership.address = self.new_email if self.email.changed?
        mailing_list_membership.digested = self.mailing_list_digested? ? 'Y' : 'N'
        mailing_list_membership.notmetoo = self.mailing_list_notmetoo? ? 'Y' : 'N'
        mailing_list_membership.nomail = self.mailing_list_nomail? ? 'Y' : 'N'
        mailing_list_membership.save if mailing_list_membership.changed?
      end
    end
  
  end
end
