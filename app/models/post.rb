class Post < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :author_id, :public, :diaspora_handle, :guid, :text, :from => 'diaspora'

  after_commit do
    PostMailer.share_post_with_friends(self).deliver
  end
end
