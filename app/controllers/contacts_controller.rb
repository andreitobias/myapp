class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:url]
      
      #ContactMailer.contact_email(name, email, body).deliver
      
      flash[:success] = "Message sent."
      redirect_to thankyou_path
    else
      flash[:danger] = "Message not sent."
      redirect_to error_path
    end  
  end 
  def index
    if admin_signed_in?
     @contacts = Contact.all
    else
      redirect_to root_path
    end 
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :url) 
    end  
end