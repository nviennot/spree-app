class Post < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :author_id, :public, :diaspora_handle, :guid, :text, :from => 'diaspora'
end
