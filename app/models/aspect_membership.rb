class AspectMembership < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :aspect_id, :contact_id, :from => 'diaspora'
end
