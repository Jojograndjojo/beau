require 'rails_helper'

feature 'admin' do

  it 'has a title' do
    visit '/admins'
    expect(page).to have_content 'manage your page'
  end

  it 'prompts the user to upload art pieces' do
    visit '/admins'
    expect(page).to have_button 'Upload Art Piece'
  end

  it 'shows drawings that have been uploaded' do
    visit '/admins'
    fill_in 'Title', with: 'Flowers'
    fill_in 'Type of art', with: 'Drawing'
    attach_file 'Image', 'public/img/flowerspainting.jpg'
    click_button 'Upload Art Piece'
    expect(page).to have_css("img[src*='flowerspainting']")
    expect(page).to have_content 'Flowers'
  end

  it 'shows paintings that have been uploaded' do
    visit '/admins'
    fill_in 'Title', with: 'Flowers'
    fill_in 'Type of art', with: 'Painting'
    attach_file 'Image', 'public/img/flowerspainting.jpg'
    click_button 'Upload Art Piece'
    expect(page).to have_css("img[src*='flowerspainting']")
    expect(page).to have_content 'Flowers'
  end

  it 'shows printmakings that have been uploaded' do
    visit '/admins'
    fill_in 'Title', with: 'Flowers'
    fill_in 'Type of art', with: 'Printmaking'
    attach_file 'Image', 'public/img/flowerspainting.jpg'
    click_button 'Upload Art Piece'
    expect(page).to have_css("img[src*='flowerspainting']")
    expect(page).to have_content 'Flowers'
  end

  it 'does not diplay images that have been deleted' do
    visit '/admins'
    fill_in 'Title', with: 'Flowers'
    fill_in 'Type of art', with: 'Printmaking'
    attach_file 'Image', 'public/img/flowerspainting.jpg'
    click_button 'Upload Art Piece'
    click_link 'delete'
    expect(page).to_not have_css("img[src*='flowerspainting']")
    expect(page).to_not have_content 'Flowers'
  end
end
