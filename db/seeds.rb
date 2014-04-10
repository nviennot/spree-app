# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Spree::Core::Engine.load_seed if defined?(Spree::Core)
#
# Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
#

def create_admin_user(email, password)
  puts "login: #{email} password: #{password}"
  attributes = {
    :password => password,
    :password_confirmation => password,
    :email => email,
    :login => email
  }

  load 'spree/user.rb'

  admin = Spree::User.new(attributes)
  admin.save!
  role = Spree::Role.find_or_create_by(name: 'admin')
  admin.spree_roles << role
  admin.save!
  admin.generate_spree_api_key!
end

def image(name)
  images_path = Pathname.new(File.dirname(__FILE__)) + "seeds"
  path = images_path + "#{name}"
  return false if !File.exist?(path)
  File.open(path)
end

create_admin_user('roger@example.com', 'pafpafpaf')

tax_category = Spree::TaxCategory.create!(:name => "Default")
shipping_category = Spree::ShippingCategory.create!(:name => "Default")

default_attrs = {
  :description => Faker::Lorem.paragraph,
  :available_on => Time.zone.now,
  :shipping_category => shipping_category,
  :tax_category => tax_category,
}

grumpy_cat_mug = Spree::Product.create!(default_attrs.merge(:name => "Grumpy cat mug", :price => 29.99))
grumpy_cat_mug.set_property("tags", "mug, cat")
grumpy_cat_mug.master.images.create!(:attachment => image('grumpy-cat-mug.jpg'))

grumpy_cat_mug = Spree::Product.create!(default_attrs.merge(:name => "Funny dog mug", :price => 29.99))
grumpy_cat_mug.set_property("tags", "mug, dog")
grumpy_cat_mug.master.images.create!(:attachment => image('dog-mug.jpg'))

