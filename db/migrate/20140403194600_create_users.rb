class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :username
      t.string   :email
      t.datetime :current_sign_in_at
      t.timestamps
    end

    create_table :contacts do |t|
      t.integer :user_id
      t.integer :person_id
      t.boolean :sharing
      t.boolean :receiving
      t.timestamps
    end

    create_table :aspect_memberships do |t|
      t.integer  :aspect_id
      t.integer  :contact_id
      t.timestamps
    end

    create_table :aspects do |t|
      t.string   :name
      t.integer  :user_id
      t.timestamps
    end

    create_table :aspect_visibilities do |t|
      t.integer  :aspect_id
      t.integer  :shareable_id
      t.string   :shareable_type
      t.timestamps
    end

    create_table :likes do |t|
      t.integer  :author_id
      t.boolean  :positive
      t.integer  :target_id
      t.string   :target_type
      t.string   :guid
      t.timestamps
    end

    create_table :people do |t|
      t.string   :guid
      t.text     :url
      t.string   :diaspora_handle
      t.integer  :owner_id
      t.timestamps
    end

    create_table :photos do |t|
      t.integer  :author_id
      t.boolean  :public
      t.string   :diaspora_handle
      t.text     :remote_photo_path
      t.string   :remote_photo_name
      t.string   :guid
      t.string   :status_message_guid
      t.timestamps
    end

    create_table :posts do |t|
      t.integer :author_id
      t.boolean :public
      t.string  :diaspora_handle
      t.string  :guid
      t.text    :text
      t.timestamps
    end

    create_table :share_visibilities do |t|
      t.integer  :shareable_id
      t.string   :shareable_type
      t.integer  :contact_id
      t.boolean  :hidden
      t.timestamps
    end
  end
end
