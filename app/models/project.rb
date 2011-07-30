class Project < ActiveRecord::Base

  belongs_to :event
  has_many :contributors, :dependent=>:destroy
  has_many :commits, :dependent=>:destroy
  
end
