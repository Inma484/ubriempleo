class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :attachments
  validates :title, presence: true, uniqueness: true
  before_save :valores_por_default
  include Picturable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def valores_por_default
  	self.costo ||=0
  end
end
