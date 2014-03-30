class Comment < ActiveRecord::Base
	belongs_to :advert
  before_save :set_owner


  private
  def set_owner
    if owner.blank?
      self.owner = "Anoniman korisnik"
    end
    # self.owner ||= "Anoniman korinsik"
  end
end
