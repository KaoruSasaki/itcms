class Content < ActiveRecord::Base
  class << self
    def find_sti_class(type_name)
      type_name.camelize.constantize
    end
 
    def sti_name
      name.underscore
    end
  end
  
  def sti_name
    self.class.c
  end
end
