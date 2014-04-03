class Person < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :guid, :url, :diaspora_handle, :owner_id, :from => 'diaspora'
end
