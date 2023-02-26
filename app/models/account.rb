class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         scope :all_expect, ->(account) {where.not(id: user)}
         after_create_commit { broadcast_append_to 'accounts' }


        
        followability
        has_many :posts
        has_many :comments
        has_many :likes
        has_many :messages
        has_one_attached :avatar

         



        def unfollow(account)
          followerable_relationships.where(followable_id: account.id).destroy_all
        end


         before_create :randomize_id
  

         private
         def randomize_id
          begin
          self.id = SecureRandom.random_number(1_000_000_000)
          end while Account.where(id: self.id).exists?
          end

          def self.ransackable_attributes(auth_object = nil)
            ["username", "email", "bio", "created_at", "updated_at"]
          end

          def self.all_except(account)
            where.not(id: account)
          end
end
