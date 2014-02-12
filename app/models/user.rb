# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password;

  before_save {email.downcase!}

  VALID_EMAIL_ADDERSS = /\A[\w+\-\.]+@[a-z]+\.([a-z]+\.)*[a-z]+\z/i;

  validates(:name, {presence: true, length: {maximum: 40}})
  validates(:email, 
  				{
  					presence: {message: 'is required.'}, 
  					format: {with: VALID_EMAIL_ADDERSS, message: 'is not valid.', on: :create},
  					uniqueness: {case_sensitive: false}
  				}
  			);
  validates(:password, 
          {
            presence: true,
            length: { minimum: 6},
            confirmation: true
          }
        );
  
  validates(:password_confirmation,
          {
            presence: true
          }
    );

end
