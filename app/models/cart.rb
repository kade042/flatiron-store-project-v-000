class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
	has_many :items, through: :line_items
  
  def total
    price = 0
    self.items.each do |p|
      price += (p.price * p.line_items[0].quantity)
    end
    price
  end

  def add_item(item_id)
    @line_item = LineItem.find_by(id: item_id)
    @line_item.nil? ?  LineItem.new(item_id: item_id, cart_id: self.id) : @line_item

  end
end
