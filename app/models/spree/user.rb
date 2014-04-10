require_dependency Spree::Auth::Engine.root.join('app', 'models', 'spree', 'user').to_s

class Spree::User < ActiveRecord::Base
  has_one :topic_user, :class_name => 'Topic::User', :foreign_key => 'email', :primary_key => 'email'
  delegate :topics, :to => :topic_user, :allow_nil => true
end
