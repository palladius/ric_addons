# RicPlugin

# Copied from book RailsRecipes#1 pag 238.
module RicAddons
  
  def search(query, fields, options = {})
    find :all, options.merge(:conditions => [[fields].flatten.map { |f| "#{f} LIKE :query"}.join(' OR '), {:query => "%#{query}%" } ] )  
  end
  
  def self.yellow(str)
    "[RicAddons] \033[1;33m#{str}\033[0m"
  end
  
  def self.ric_websites_ring
    {
      'RAB'   => 'http://ric_addressbook.heroku.com' ,
      'Pasta' => 'http://pasta.heroku.com' ,
      
    }
  end
end