class Sale < ActiveRecord::Base

  def finished? #these are not actually method calls. they are more like attributes we are creating.
    ends_on < Date.current # you could also see self.ends_on
  end 

  def upcomming?
    starts_on > Date.current
  end

  def active?
    !upcomming? && !finished?
  end

end
