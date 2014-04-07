class Aspect < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :name, :user_id, :from => 'diaspora'

  belongs_to :user

  has_many :aspect_memberships, :dependent => :destroy
  has_many :contacts, :through => :aspect_memberships

  has_many :aspect_visibilities
end
