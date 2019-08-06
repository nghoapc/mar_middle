Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/test_api' => 'api#vend'
  post '/test_api_post' => 'api#vend_2'
  post '/test_api_product' => 'api#vend_3'
end
