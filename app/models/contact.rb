class Contact < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :user_id, :person_id, :sharing, :receiving, :from => 'diaspora'

  belongs_to :user
  belongs_to :person
end
