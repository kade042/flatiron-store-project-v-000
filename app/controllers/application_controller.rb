class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_in)  {|u| u.permit(:name, :email, :password, :password_confirmation, :current_cart_id)}
  end

  #private
  #  def current_cart
  #    @user = User.find_by(id: current_user.id)
  #    if @user.current_cart.nil?
  #       @user.current_cart = Cart.create!
  #       @user.save
  #     end
  #     @user.current_cart
  #  end

end
