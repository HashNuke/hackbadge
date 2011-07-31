class Project < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  has_many :contributors, :dependent=>:destroy
  has_many :commits, :dependent=>:destroy
  has_many :votes, :dependent=>:destroy

  accepts_nested_attributes_for :contributors

end
