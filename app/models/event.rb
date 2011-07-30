class Event < ActiveRecord::Base

  has_many :projects, :dependent=>:destroy

  def to_param
    self.slug
  end

end
