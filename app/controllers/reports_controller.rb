class ReportsController < ApplicationController
  #before_action :authenticate_Contact!
  #before_action :only_current_Contact
  
  def new
    # form where a Contact can fill out their own report.
    @contact = Contact.find( params[:contact_id] )
    @report = Report.new
  end
  
  def create 
    @contact = Contact.find( params[:contact_id] )
    @report = @contact.build_report(report_params)
    if report.save
      flash[:success] = "report Updated!"
      redirect_to Contact_path( params[:contact_id] )
    else
      render action: :new
    end
  end
  
  def edit
    @contact = Contact.find( params[:contact_id] )
    @report = @contact.report
  end
  
  def update
    @contact = Contact.find( params[:contact_id] )
    report = @contact.report
    if report.update_attributes(report_params)
      flash[:success] = "report Updated!"
      redirect_to contact_path( params[:contact_id] )
    else
      render action: :edit
    end
  end
  
  private
    def report_params
      params.require(:report).permit(:impression, :mobile, :speed)
    end
  
    #def only_current_Contact
      #@contact = Contact.find( params[:contact_id] )
      #redirect_to(root_url) unless @contact == current_Contact
    #end
  end


