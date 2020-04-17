class Product < ApplicationRecord

    validates :name, {presence: true}
    validates :product_img, {presence: true}
    validates :money, {presence: true}
    validates :description, {presence: true}
    validates :description, {length: {maximum: 300}}


end
