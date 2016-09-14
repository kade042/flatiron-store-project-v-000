class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)



    #resource.current_cart_id = @cart.id

    resource_saved = resource.save
    #resource.current_cart = resource.carts.create
    #resource.current_cart = @cart
    #binding.pry
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      respond_with resource
    end
  end

  def destroy
    resource.loginable.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_flashing_format?
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_cart_id)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_cart_id)
  end
end
