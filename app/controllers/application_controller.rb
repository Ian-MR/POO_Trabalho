class ApplicationController < ActionController::Base
  before_action :set_current_user  

  def set_current_user
    if session[:usuario_id]
       Current.usuario = Usuario.find_by(id: session[:usuario_id])
    end
  end
end
