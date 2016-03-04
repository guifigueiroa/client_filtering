class FiltersController < ApplicationController
  def index
    if params.has_key?(:filter)
      if save_filter_params == t(:save_filter)
        redirect_to new_filter_path params
      else
        params.delete :authenticity_token
        redirect_to contacts_path params
      end
    elsif params.has_key?(:selected_filter) && load_filter_params != t(:select)
      redirect_to contacts_path Contact.search_by_filter(load_filter_params)
    else
      redirect_to contacts_path Contact.all.order(:name)
    end
  end
  
  def new
    @filter = Filter.new(filter_params)
    if @filter.save
      flash[:success] = t :filter_created
    else
      flash[:danger] = @filter.errors.full_messages.first
    end
    redirect_to contacts_path
  end
  
  private
  
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
