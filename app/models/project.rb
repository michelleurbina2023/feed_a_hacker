class Project < ActiveRecord::Base
  attr_accessible :description, :name, :url, :screenshot, :hacker_id, :hacker

  has_attached_file :screenshot
  belongs_to :hacker
end
