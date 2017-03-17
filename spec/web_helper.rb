
def create_user
  user = User.create(username: 'username', password: 'password', password_confirmation:  'password')
end


def log_in
  visit '/admins/login'
  fill_in 'username', with: 'username'
  fill_in 'password', with: 'password'
  click_button 'Log in'
end

def create_art_piece(art_type)
  create_user
  log_in
  fill_in 'Title', with: 'Flowers'
  fill_in 'Type of art', with: art_type
  select '2017', from: 'Year'
  attach_file 'Image', 'public/img/flowerspainting.jpg'
  click_button 'Upload Art Piece'
end
