
def create_user
  user = User.create(username: 'username', password: 'password', password_confirmation:  'password')
end


def log_in
  visit '/admins/login'
  fill_in 'username', with: 'username'
  fill_in 'password', with: 'password'
  click_button 'Log in'
end
