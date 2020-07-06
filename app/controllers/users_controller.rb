class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @register_form = RegisterForm.new
  end

  def create
    @register_form = RegisterForm.new(register_form_params)

    if @register_form.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def register_form_params
    params.require(:register_form).permit(:user_name, :user_email, :user_password, :user_password_confirmation, :company_name, :company_address)
  end
end
