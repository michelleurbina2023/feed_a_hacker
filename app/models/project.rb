class Project < ActiveRecord::Base
  attr_accessible :description, :name, :url, :screenshot, :hacker_id, :hacker

  has_attached_file :screenshot, :styles => { :medium => "960x500>", :thumb => "200x200>" }
  belongs_to :hacker
end
