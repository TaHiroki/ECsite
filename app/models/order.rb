class Order < ApplicationRecord

    def product
        return Product.find_by(id: self.product_id)
    end
end
