class Aspect < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :name, :user_id, :from => 'diaspora'
end
