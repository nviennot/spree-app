class AspectMembership < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :aspect_id, :contact_id, :from => 'diaspora'

  belongs_to :aspect
  belongs_to :contact
  has_one :user, :through => :contact
  has_one :person, :through => :contact
end
