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
    if seek != ""
      Item.where('name LIKE(?)', "%#{seek}%").where(user_id: user_id)
    else
      Item.where.(user_id: current_user.id).order("created_at DESC")
    end
  end
end