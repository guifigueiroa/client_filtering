class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @states = State.all
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = t :contact_created
      redirect_to contacts_path
    else
      @states = State.all
      render 'new'
    end
  end

  def index
    @contacts = Contact.all.order(:name)
    @states = State.all
    @roles = Contact.select(:role).uniq.order(:role)
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :age, :state, :role)
  end
end