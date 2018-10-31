# rubocop:disable Style/ClassAndModuleChildren
module Turnip::Steps
  # rubocop:enable Style/ClassAndModuleChildren
  attr_accessor  :user

  # GIVEN

  step ':page page of web application' do |page|
    page.open
  end

  # WHEN

  step 'I am navigating on :page page' do |page|
    page.open
  end

  step 'I click :text menu item on :page page' do |text, page|
    page.on { main_menu_section.choose_menu(text.capitalize) }
  end

  step 'I click :text link on :page page' do |text, page|
    page.on { navigate_to_link(text.capitalize) }
  end

  # THEN

  step 'I should be redirected to :page page' do |page|
    expect(page).to be_displayed
  end

  step 'I should be logged in the system' do
    HomePage.on do
      is_expected.to have_main_menu_section
      expect(main_menu_section).to be_authenticated(out(:@user).name)
    end
  end

  step 'I should not be logged in the system' do
    HomePage.on do
      is_expected.to have_main_menu_section
      expect(main_menu_section).to be_not_authenticated
    end
  end

  step 'I should see following text :text on :page page' do |message, page|
    page.on { expect(text).to include(message) }
  end
end
