class Post < ActiveRecord::Base
  include Promiscuous::Decorator
  subscribe :author_id, :public, :diaspora_handle, :guid, :text, :from => 'diaspora'
  publish :sentiment, :concepts

  belongs_to :author, :class_name => 'Person'

  before_create :do_analysis
  after_create :update_author

  serialize :concepts

  def do_analysis
    if text.present?
      r = Textalytics.get_media(self.text, :timeref => self.created_at)
      self.sentiment = {'N' => 'negative', 'P' => 'positive',
                       'NEU' => 'neutral', 'NONE' => 'none'}[r['sentiment']]
      self.concepts = r['concepts'].map { |c| c['form'] }
    end
  end

  def update_author
    owner = author.try(:owner)
    if owner
      posts = Post.where(:author_id => self.author_id)
                .where(:sentiment => 'positive')
                .order(:created_at => :desc)
                .limit(5)
                .to_a
      concepts = posts.map(&:concepts).compact.flatten
      owner.update_attributes!(:topics => concepts)
    end
  end
end
