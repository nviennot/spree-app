class AddSentiment < ActiveRecord::Migration
  def change
    add_column :posts, :sentiment, :string
    add_column :posts, :concepts, :text
    add_column :users, :topics, :text
  end
end
