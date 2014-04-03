class PostMailer < ActionMailer::Base
  default from: "from@example.com"

  def post_email(post)
    @post = post
    binding.pry
  end
end
