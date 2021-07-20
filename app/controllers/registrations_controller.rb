class RegistrationsController < Devise::RegistrationsController

  before_action :one_author_registered?, only: [:new, :create]

  def update
    if (update_resource(current_author, author_params))
      redirect_to root_path
    end
  end

  private

  def author_params
    params.require(:author).permit(:email, :password, :password_confirmation,
       :current_password, author_profile_attributes: [:id, :authorname, :biography])
  end
  
  protected

  def one_author_registered?
    if Author.count == 1
      if author_signed_in?
        redirect_to root_path
      else
        redirect_to new_author_session_path
      end
    end  
  end
end