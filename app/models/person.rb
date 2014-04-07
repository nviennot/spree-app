class Person < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :guid, :url, :diaspora_handle, :owner_id, :from => 'diaspora'

  belongs_to :owner, :class_name => 'User'
end
