class ShareVisibility < ActiveRecord::Base
  include Promiscuous::Subscriber
  subscribe :shareable_id, :shareable_type, :contact_id, :hidden, :from => 'diaspora'

  belongs_to :contact
  belongs_to :shareable, :polymorphic => true
end
