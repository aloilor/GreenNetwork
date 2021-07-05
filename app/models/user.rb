class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  acts_as_user :roles => [:reguser, :admin]
  has_many :posts, :dependent => :destroy
  acts_as_voter
  has_one_attached :propic, :dependent => :destroy
  
    


def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  
  #Helper methods per Canard
  def is_reguser?
    return (self.roles_mask & 1) == 1
  end

  def set_reguser
    self.roles_mask = (self.roles_mask | 1)
    self.save
  end

  def unset_reguser
    self.roles_mask = 0
    self.save 
  end 

  def is_admin?
    return (self.roles_mask & 2) == 2
  end

  def set_admin
    self.roles_mask = (self.roles_mask | 2) 
    self.save
  end

  def unset_admin
    self.roles_mask = (self.roles_mask & 1) 
    self.save
  end

  def is_banned?
    return self.roles_mask  == 0
  end
  

end


