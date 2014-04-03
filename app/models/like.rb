class Like < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :positive, :target_id, :target_type, :author_id, :guid, :from => 'diaspora'
end
