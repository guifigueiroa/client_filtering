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
    if params.has_key?(:contact)
      if save_filter_params == t(:save_filter)
        redirect_to new_filter_path params
      else
        @contacts = Contact.search(contact_params)
      end
    else
      @contacts = Contact.all.order(:name)
    end
    
    @states = State.all
    @roles = Contact.select(:role).uniq.order(:role)
    @filters = Filter.select(:filter_name).order(:filter_name)
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :age, :state, :role, :age_to, :age_from, :op_state, :op_role)
  end
  
  def save_filter_params
    params.require(:commit)
  end
end