# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name

  VALID_EMAIL_ADDERSS = /\A[\w+\-\.]+@[a-z]+\.([a-z]+\.)*[a-z]+\z/i;

  validates(:name, {presence: true, length: {maximum: 40}})
  validates(	:email, 
  				{
  					presence: {message: 'is required.'}, 
  					format: {with: VALID_EMAIL_ADDERSS, message: 'is not valid.', on: :create},
  					uniqueness: {case_sensitive: false}
  				}
  			);
end