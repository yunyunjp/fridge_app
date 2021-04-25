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
end