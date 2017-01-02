require 'rails_helper'

feature 'homepage' do

  it 'should display the title of the website' do
    visit '/'
    expect(page).to have_content 'Jonathan Passé'
  end

  it 'should have a link to a drawings page' do
    visit '/'
    click_link 'Drawings'
    expect(current_path).to eq '/artpieces/drawings'
    expect(page).to have_content 'Drawings'
  end

  it 'should have a link to a paintings link' do
    visit '/'
    click_link 'Paintings'
    expect(current_path).to eq '/artpieces/paintings'
    expect(page).to have_content 'Paintings'
  end

  it 'should have a printmakings link' do
    visit '/'
    click_link 'Printmakings'
    expect(current_path).to eq '/artpieces/printmakings'
    expect(page).to have_content 'Printmakings'
  end

end
