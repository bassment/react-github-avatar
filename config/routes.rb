Rails.application.routes.draw do
  root 'react#avatar'
  get 'button' => 'react#increment_button'
end
