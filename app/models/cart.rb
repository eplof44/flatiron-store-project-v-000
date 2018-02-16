class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item)
    line_item = self.line_items.find_by(item_id: item)
    if line_item
      line_item.quantity +=1
      line_item.save
    else
      line_item = self.line_items.build(item_id: item)
    end
    line_item
  end

  def total
    self.line_items.each.sum do |line_item|
      line_item.item.price * line_item.quantity
    end
  end

end
