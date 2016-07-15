class Stash < ActiveRecord::Base
  attr_accessible :body, :parent_id, :title, :url, :image, :blob
    
  include ActiveRecord::Acts::Tree

  acts_as_tree :order => "title"

  acts_as_taggable
  
  self.per_page = 10
  
  ##
  
  ## Adding both an image and a blob for easy thumbnail generation and metadata
  ## extraction. This way I don't have to jump through hoops to tell if a particular
  ## blob is an image, nor generate thumbnails for it. I can also have stashes with both
  ## images and blobs should I choose
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :blob
  
  
  ## Why a many-to-many-self when I already have acts_as_tree? In the wild, hamsters
  ## create little stashes of seeds and bedding and then create tunnels between them as
  ## they feel the need. Certain kinds of data will work like this, too. If I create a
  ## stash that logically deserves a link to a stash that is not its parent or a sibling,
  ## it can link there with no hassle. IE, stashes can have both parent, child, and sibling
  ## stashs, but can also have networked stashes
  
  has_many :stash_tunnels, :dependent => :delete_all
  has_many :network_stashes, :through => :stash_tunnels, :class_name => "Stash", :foreign_key => "network_stash_id"
  
  has_many :metadata, :class_name => "Metadatum", :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  
  validates :body, :presence => true
  validates :title, :presence => true

  #scope :borple, Stash.joins(:stash_tunnels).where("network_stash_id = ?", self.id)
  #apparently named scopes don't work correctly under ruby 1.8.7?
  def inverse_tunnels
    Stash.joins(:stash_tunnels).where("network_stash_id = ?", self.id)
  end
  
  def all_tunnels
    (self.network_stashes + self.inverse_tunnels).uniq
  end
end
