class PostComment < ApplicationRecord
    # UserモデルとPostモデルを関連付け
    belongs_to :user
    belongs_to :post
end
