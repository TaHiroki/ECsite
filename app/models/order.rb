class Order < ApplicationRecord

    validates :user_id, {presence: true}
    validates :product_id, {presence: true}
    validates :count, {presence: true}

    def product
        return Product.find_by(id: self.product_id)
    end
end
