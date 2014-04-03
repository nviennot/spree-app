class User < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :username, :email, :current_sign_in_at, :from => 'diaspora'
end
