class Post < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :author_id, :public, :diaspora_handle, :guid, :text, :from => 'diaspora'

  has_many :photos, :foreign_key => :status_message_guid, :primary_key => :guid
  has_many :aspect_visibilities, :as => :shareable
  has_many :aspects, :through => :aspect_visibilities

  has_many :share_visibilities, :as => :shareable
  has_many :contacts, :through => :share_visibilities
  has_many :recipients, :through => :contacts, :source => :user

  belongs_to :author, :class_name => 'Person'

  after_commit :on => :create do
    PostMailer.share_post_with_friends(self).deliver if photos.any?
  end
end
