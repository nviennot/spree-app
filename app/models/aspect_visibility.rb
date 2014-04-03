class AspectVisibility < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :aspect_id, :shareable_id, :shareable_type, :from => 'diaspora'
end
