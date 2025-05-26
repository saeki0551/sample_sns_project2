class Post < ApplicationRecord
    validates :user_id, presence: true  #誰が投稿したかという情報は必要不可欠なので、user_idにバリデーションを設定する。
    belongs_to :user
    has_one_attached :image #追加
    has_many :favorites, dependent: :destroy
    
    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
end
