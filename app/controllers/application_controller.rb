class ApplicationController < ActionController::Base
  before_action :set_current_user  

  def set_current_user
    if session[:usuario_id]
       Current.usuario = Usuario.find_by(id: session[:usuario_id])
    end
  end
  def require_user_logged_in!
    redirect_to sign_in_path if Current.usuario.nil?
  end
end
