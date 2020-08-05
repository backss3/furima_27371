class Users::RegistrationsController < Devise::RegistrationsController
  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :encrypted_password, :first_name, :family_name, :first_name_kana, :family_name_kana, :birthday)
  end
end
