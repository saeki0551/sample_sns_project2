class Post < ApplicationRecord
    validates :user_id, {presence: true} #誰が投稿したかという情報は必要不可欠なので、user_idにバリデーションを設定する。
    belongs_to :user
    has_one_attached :image #追加
end
