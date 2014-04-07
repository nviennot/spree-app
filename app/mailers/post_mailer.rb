class PostMailer < ActionMailer::Base
  def share_post_with_friends(post)
    @post = post
    @author = post.author.owner
    mail :from    => @author.email,
         :to      => @post.recipients.map(&:email),
         :subject => "#{@author.username} shared a photo"
  end
end
