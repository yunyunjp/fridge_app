class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :purchase_date
    validates :expiration_date
    validates :image
    validates :quantity, numericality: {
                           greater_than_or_equal_to: 1,
                           less_than_or_equal_to: 100
                           }
  end

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all.order("created_at DESC")
    end
  end

  def self.seek(seek)
    if seek !=""
     where('name LIKE(?)', "%#{seek}%")
    else
      current_user.items.order("created_at DESC")  
    end
  end

  scope :sort_items, -> (sort_order) {
   order(sort_order[:sort])
  }

  scope :sort_list, -> { 
    {
      "並び替え" => "", 
      "賞味期限の新しい順" => "expiration_date desc",
      "賞味期限の古い順" => "expiration_date asc", 
    }
  }
end