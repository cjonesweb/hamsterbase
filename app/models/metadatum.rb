class Metadatum < ActiveRecord::Base
  attr_accessible :content, :name, :stash_id
  
  validates :content, :presence => true
  validates :name, :presence => true

  
  belongs_to :stash
  
end
