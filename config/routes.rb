Rails.application.routes.draw do

  namespace :group_one do 
    get  '/turn',     to: 'turns#loop'
    get  '/start',    to: 'turns#start'
    get  '/point',    to: 'turns#point'
    get  '/success',  to: 'turns#success'
    get  '/name',     to: 'turns#name'
    
    scope 'relatorio' do 
      get '/', to: 'reports#index'
    end
  end
  
  namespace :group_two do 
  end
  
  namespace :group_three do 
  end
end
