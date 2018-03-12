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
    if @report.save
      flash[:success] = "report Updated!"
      redirect_to contact_report_path( params[:contact_id] )
    else
      render action: :new
    end
  end
  
  def show
    # form where a Contact can fill out their own report.
    @contact = Contact.find( params[:contact_id] )
    @report = @contact.report
    @what = @contact.report.what
    @who = @contact.report.who
    @wiifm = @contact.report.wiifm
    @mobile = @contact.report.mobile
    @speed = @contact.report.speed
    @whattodo = @contact.report.whattodo
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "report",
        
         background:  true
        # Excluding ".pdf" extension.
      end
    end
  end
  
  def edit
    @contact = Contact.find( params[:contact_id] )
    @report = @contact.report
  end
  
  def update
    @contact = Contact.find( params[:contact_id] )
    @report = @contact.report
    if @report.update_attributes(report_params)
      flash[:success] = "report Updated!"
      redirect_to contact_report_path( params[:contact_id] )
    else
      render action: :edit
    end
  end

  def destroy
    @contact = Contact.find( params[:contact_id] )
    @report = @contact.report
    if @report.present?
      @report.destroy
      @contact.destroy
      redirect_to contacts_path
    else
      redirect_to contacts_path
    end
  end

  private
    def report_params
      params.require(:report).permit(:what, :who, :wiifm, :whattodo, :mobile, :speed)
    end
  
    #def only_current_Contact
      #@contact = Contact.find( params[:contact_id] )
      #redirect_to(root_url) unless @contact == current_Contact
    #end
  end


