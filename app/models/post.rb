class Post < ApplicationRecord
  belongs_to :account

  
  has_many_attached :images
  has_many :comments
  has_many :likes


  before_create :randomize_id
  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000)
    end while Account.where(id: self.id).exists?
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[account_id created_at descriptions id keywords updated_at]
  end
end
