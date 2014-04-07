class Post < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :author_id, :public, :diaspora_handle, :guid, :text, :from => 'diaspora'

  belongs_to :author, :class_name => 'Person'
end
