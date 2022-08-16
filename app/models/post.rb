class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments
  
  def categories_attributes=(category_attributes)
    check = category_attributes["0"]["name"] == ""
    if check == false
      category_attributes.values.each do |ca|
          category = Category.find_or_create_by(ca)
          self.categories << category
      end
    end
  end

end
