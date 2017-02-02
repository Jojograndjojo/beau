require 'rails_helper'

feature 'homepage' do

  it 'should have a link to a drawings page' do
    visit '/'
    click_link 'DRAWINGS'
    expect(current_path).to eq '/artpieces/drawings'
    expect(page).to have_content 'Drawings'
  end

  it 'should have a link to a paintings link' do
    visit '/'
    click_link 'PAINTINGS'
    expect(current_path).to eq '/artpieces/paintings'
    expect(page).to have_content 'Paintings'
  end

  it 'should have a printmakings link' do
    visit '/'
    click_link 'PRINTMAKINGS'
    expect(current_path).to eq '/artpieces/printmakings'
    expect(page).to have_content 'Printmakings'
  end

end
