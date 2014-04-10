class CreateTopicUsers < ActiveRecord::Migration
  def change
    create_table :topic_users do |t|
      t.string   :username
      t.string   :email
      t.datetime :current_sign_in_at
      t.text     :topics
      t.timestamps
    end
  end
end
