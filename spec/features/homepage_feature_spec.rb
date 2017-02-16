require 'rails_helper'

feature 'homepage' do

  it 'should have a link to a drawings page' do
    visit '/'
    click_button 'Drawings'
  end

  it 'should have a link to a paintings link' do
    visit '/'
    click_button 'Paintings'
  end

  it 'should have a printmakings link' do
    visit '/'
    click_button 'Printmaking'
  end

end
