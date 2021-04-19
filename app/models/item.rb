class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :purchase_date
    validates :expiration_date
    validates :image
  end
  
  validates :quantity, numericality: {
                       greater_than_or_equal_to: 1,
                       less_than_or_equal_to: 100
                       }


  def days_left(expiration_date, purchase_date)
    adjusted_value = expiration_date.day >= purchase_date.day ? 1 : 0
    days = ((expiration_date.year * 12) + expiration_date.month) - ((purchase_date.year * 12) + purchase_date.month) + adjusted_value
  end 
end