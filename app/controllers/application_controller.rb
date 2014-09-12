class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_company, :set_group

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    id = params[:company_id] ? params[:company_id] : params[:id]
    @company = Company.find(id)
  end

  def set_group
    group_id = params[:group_id] ? params[:group_id] : params[:id]
    @group = @company.groups.find(group_id)
  end

  def set_user
    user_id = params[:user_id] ? params[:user_id] : params[:id]
    @user = @group.users.find(user_id)
  end

end
