class Post < ApplicationRecord
    validates :user_id, {presence: true} #誰が投稿したかという情報は必要不可欠なので、user_idにバリデーションを設定する。
    belongs_to :user
end
