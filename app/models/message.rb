class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
  # unlessオプションにメソッド名を指定することで、「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件を作る

  def was_attached?
    self.image.attached?
    # self.image.attached?という記述によって、画像があればtrue、なければfalseを返す
  end
end
