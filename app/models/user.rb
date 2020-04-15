class User < ApplicationRecord

    validates :name, {presence: true}
    validates :email, {presence: true}
    validates :email, {uniqueness: true}
    validates :password, {presence: true}
    validates :admin_id, {presence: true}
    validates :count, {presence: true}

end
