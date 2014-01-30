# This migration comes from voluntary_text_creation_engine (originally 20121030100815)
class AddTextCreationProduct < ActiveRecord::Migration
  def up
    area = Area.create(name: 'General')
    product = Product.new(name: 'Text Creation', text: 'Dummy', area_ids: [area.id])
    user = User.where(name: 'Master').first
    
    unless user
      role = :master
      attributes = {
        name: role.to_s.humanize, first_name: 'Mister', last_name: role.to_s.humanize, email: "#{role}@volontari.at",
        password: "#{role}2012", language: 'en', country: 'Germany', interface_language: 'en'
      }
      attributes[:password_confirmation] = attributes[:password]
      
      user = User.create(attributes)
    end
    
    product.user_id = user.id
    product.save
  end

  def down
    Area.where(name: 'General').first.destroy
    Product.where(name: 'Text Creation').first.destroy
  end
end