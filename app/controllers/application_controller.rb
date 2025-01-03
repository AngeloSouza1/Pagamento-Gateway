class ApplicationController < ActionController::Base
  # Redirecionar admins para o painel administrativo após login
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_payments_path # ou outra rota do painel admin
    else
      authenticated_root_path # Rota padrão para usuários normais
    end
  end

  # Redirecionar após logout
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      new_user_session_path
    end
  end
end
