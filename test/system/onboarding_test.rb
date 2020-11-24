# frozen_string_literal: true

require 'application_system_test_case'

class OnboardingTest < ApplicationSystemTestCase
  test 'complete onboarding flow' do
    visit builder_path
    assert_selector 'h1', text: 'Crea tu menú'

    fill_in 'merchant[name]', with: 'La tazita de té'
    click_on 'Continuar'

    assert_text 'La tazita de té'

    3.times do |idx|
      fill_in "menu[items_attributes][#{idx}][name]", with: "Expresso #{idx}"
      fill_in "menu[items_attributes][#{idx}][price]", with: (20 + idx).to_s
    end

    click_on 'Vista previa'

    assert_text '¡Ya casi terminas!'
    assert_text 'Expresso 1'
    assert_text '22.00'
    assert_text 'politica de privacidad'

    fill_in 'user[email]', with: 'test@example.com'
    fill_in 'user[password]', with: 'secret123'
    fill_in 'user[password_confirmation]', with: 'secret123'

    click_on 'Crear cuenta'

    assert_text 'La tazita de té'
    assert_text 'Expresso 0'
    assert_text 'Expresso 1'
    assert_text 'Expresso 2'
  end
end
