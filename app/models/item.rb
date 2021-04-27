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

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(expiration_date: :DESC)
    when 'old'
      return all.order(expiration_date: :ASC)
    end
  end
end