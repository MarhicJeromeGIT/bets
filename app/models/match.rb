class Match < ActiveRecord::Base
  TIE  = 'N'
  WIN  = 'G'
  LOSE = 'P'
  
  
  def host_country
    return Country.find_by_name(host_name)
  end
  
  def guest_country
    return Country.find_by_name(host_name)
  end
end
