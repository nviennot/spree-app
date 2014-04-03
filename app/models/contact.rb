class Contact < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :user_id, :person_id, :sharing, :receiving, :from => 'diaspora'
end
