class PagesController < ApplicationController
  def home
    @contact = Contact.new
  end
  
  def thankyou
    @contact = Contact.new
  end  
  
  def error
    @contact = Contact.new
  end
  
end
