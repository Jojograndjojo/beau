require 'rails_helper'

feature 'admin' do

  it 'has link to an add admin page' do
    create_user
    log_in
    click_link 'Add a new admin'
    fill_in 'Username', with: 'rob'
    fill_in 'Password', with: '1234'
    fill_in 'Password confirmation', with: '1234'
    click_button 'Submit'
    expect(User.all.size).to eq 2
    expect(current_path).to eq '/admins'
  end


  it 'shows drawings that have been uploaded' do
    create_user
    log_in
    fill_in 'Title', with: 'Flowers'
    fill_in 'Type of art', with: 'Drawing'
    attach_file 'Image', 'public/img/flowerspainting.jpg'
    click_button 'Upload Art Piece'
    expect(page).to have_css("img[src*='flowerspainting']")
    expect(page).to have_content 'Flowers'
  end

  it 'shows paintings that have been uploaded' do
    create_user
    log_in
    fill_in 'Title', with: 'Flowers'
    fill_in 'Type of art', with: 'Painting'
    attach_file 'Image', 'public/img/flowerspainting.jpg'
    click_button 'Upload Art Piece'
    expect(page).to have_css("img[src*='flowerspainting']")
    expect(page).to have_content 'Flowers'
  end

  it 'shows printmakings that have been uploaded' do
    create_user
    log_in
    fill_in 'Title', with: 'Flowers'
    fill_in 'Type of art', with: 'Printmaking'
    attach_file 'Image', 'public/img/flowerspainting.jpg'
    click_button 'Upload Art Piece'
    expect(page).to have_css("img[src*='flowerspainting']")
    expect(page).to have_content 'Flowers'
  end

  it 'does not diplay images that have been deleted' do
    create_user
    log_in
    fill_in 'Title', with: 'Flowers'
    fill_in 'Type of art', with: 'Printmaking'
    attach_file 'Image', 'public/img/flowerspainting.jpg'
    click_button 'Upload Art Piece'
    click_link 'delete'
    expect(page).to_not have_css("img[src*='flowerspainting']")
    expect(page).to_not have_content 'Flowers'
  end

  it 'sends a mail invitation to become administrator' do
    create_user
    log_in
    click_link 'Admin management'
    fill_in 'Name', with: 'Jacques'
    fill_in 'Email', with: 'j_passe@live.fr'
    click_button 'Send invitation'
  end


end
