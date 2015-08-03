class AddTextCreationProduct < ActiveRecord::Migration
  def up
    area = Area.create(name: 'General')
    
    product = Product::TextCreation.new(name: 'Text Creation', text: 'Dummy', area_ids: [area.id])
    product.user_id = User.where(name: 'Master').first.id
    product.save
  end

  def down
    Area.where(name: 'General').first.destroy
    Product::TextCreation.first.destroy
  end
end