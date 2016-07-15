module ApplicationHelper
  
  def list_parent_stashes
    Stash.order('title ASC').where(:parent_id => nil)
  end 

end
