class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  validates_presence_of :username

  serialize :facility_id
  serialize :program_id

  def password_required?
    new_record? ? false : super
  end

  def email_required?
    true
  end
end
