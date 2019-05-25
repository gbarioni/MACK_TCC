class Arquivo < ApplicationRecord

  validates :titulo, presence: true, length: { maximum: 50 }
  validates :autor, presence: true
  validates :ano, presence: true
  validates :licenca, presence: true


  belongs_to :user

end
