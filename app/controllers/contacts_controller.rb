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
    if params.has_key?(:filter)
      if save_filter_params == t(:save_filter)
        redirect_to new_filter_path params
      else
        @contacts = Contact.search(filter_params)
      end
    elsif params.has_key?(:selected_filter) && load_filter_params != t(:select)
      @contacts = Contact.search_by_filter(load_filter_params)
    else
      @contacts = Contact.all.order(:name)
    end
    
    @states = State.all
    @roles = Contact.select(:role).uniq.order(:role)
    @filters = Filter.select(:id, :filter_name).order(:filter_name)
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :age, :state, :role, :age_to, :age_from, :op_state, :op_role)
  end
  
  def filter_params
    params.require(:filter).permit(:filter_name, :age_from, :age_to, :op_state, :state, :op_role, :role)
  end
  
  def save_filter_params
    params.require(:commit)
  end
  
  def load_filter_params
    params.require(:selected_filter)
  end
end