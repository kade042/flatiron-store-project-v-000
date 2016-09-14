class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    items = []
    self.all.map { |i| items << i if i.inventory != 0 }
    items
  end

  
end
