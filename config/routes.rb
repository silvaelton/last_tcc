Rails.application.routes.draw do

  namespace :group_one, path: 'grupo_um' do 
    root 'turns#welcome'
    
    get  '/turno',     to: 'turns#loop',        as: 'turn'
    get  '/inicio',    to: 'turns#start',       as: 'start'
    get  '/ponto',     to: 'turns#point',       as: 'point'
    get  '/sucesso',   to: 'turns#success',     as: 'success'
    get  '/nome',      to: 'turns#name',        as: 'name'
    
    get '/resultado',  to: 'reports#index',     as: 'result'
  end
  
  namespace :group_two, path: 'grupo_dois' do 
    root 'turns#welcome'
    
    get  '/turno',     to: 'turns#loop',        as: 'turn'
    get  '/inicio',    to: 'turns#start',       as: 'start'
    get  '/ponto',     to: 'turns#point',       as: 'point'
    get  '/sucesso',   to: 'turns#success',     as: 'success'
    get  '/nome',      to: 'turns#name',        as: 'name'
    
    get '/resultado',  to: 'reports#index',     as: 'result'

  end
  
  namespace :group_three do 
  end
end
