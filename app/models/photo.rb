class Photo < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :author_id, :public, :diaspora_handle, :remote_photo_path,
            :remote_photo_name, :guid, :status_message_guid, :from => 'diaspora'
end
