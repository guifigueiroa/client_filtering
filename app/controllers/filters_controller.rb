class FiltersController < ApplicationController
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
end
