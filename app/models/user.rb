class User < ApplicationRecord

    has_secure_password

    validates :name, {presence: true}
    validates :email, {presence: true}
    validates :email, {uniqueness: true}
    validates :admin_id, {presence: true}
    validates :count, {presence: true}

end
