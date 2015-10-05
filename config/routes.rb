Rails.application.routes.draw do

  namespace :group_one, path: 'grupo_um' do 
    root 'turns#welcome'
    
    get  '/turno',     to: 'turns#loop',        as: 'turn'
    get  '/inicio',    to: 'turns#start',       as: 'start'
    get  '/ponto',     to: 'turns#point',       as: 'point'
    get  '/sucesso',   to: 'turns#success',     as: 'success'
    get  '/nome',      to: 'turns#name',        as: 'name'
    
    scope 'relatorio' do 
      get '/', to: 'reports#index'
    end
  end
  
  namespace :group_two do 
  end
  
  namespace :group_three do 
  end
end
