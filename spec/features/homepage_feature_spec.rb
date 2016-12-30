require 'rails_helper'

feature 'homepage' do

  it 'should display the title of the website' do
    visit '/'
    expect(page).to have_content 'Jonathan Passé'
  end


end
