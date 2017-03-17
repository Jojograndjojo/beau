require 'rails_helper'

feature 'homepage' do

  it 'should have a link to a drawings page' do
    create_art_piece 'Drawing'
    visit '/'
    click_button 'Drawings'
    expect(page).to_not have_css("img[src*='flowerspainting']")
  end

  it 'should have a link to a paintings link' do
    create_art_piece 'Painting'
    visit '/'
    click_button 'Paintings'
    expect(page).to_not have_css("img[src*='flowerspainting']")
  end

  it 'should have a printmakings link' do
    create_art_piece 'Printmaking'
    visit '/'
    click_button 'Printmaking'
    expect(page).to_not have_css("img[src*='flowerspainting']")
  end

  xit 'should display carousel on image click' do
    create_art_piece 'Printmaking'
    visit '/'
    click_button 'Printmaking'
    click_on "img"
  end

end
