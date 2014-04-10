class Topic::User < ActiveRecord::Base
  include Promiscuous::Subscriber

  self.table_name = 'topic_users'
  subscribe :username, :email, :current_sign_in_at, :from => 'diaspora', :as => 'User'
  subscribe :topics, :from => 'diaspora-topic', :as => 'User'

  serialize :topics
end
