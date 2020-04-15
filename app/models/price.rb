class Price < ApplicationRecord

    validates :count, {presence: true}
    validates :price, {presence: true}

end
