class User < ActiveRecord::Base
  include Promiscuous::Decorator
  subscribe :username, :email, :current_sign_in_at, :from => 'diaspora'
  publish :topics

  serialize :topics
end
