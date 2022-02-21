require 'application_system_test_case'

class DogrunsTest < ApplicationSystemTestCase
  setup do
    @dogrun = dogruns(:one)
  end

  test 'visiting the index' do
    visit dogruns_url
    assert_selector 'h1', text: 'Dogruns'
  end

  test 'creating a Dogrun' do
    visit dogruns_url
    click_on 'New Dogrun'

    fill_in 'Address', with: @dogrun.address
    fill_in 'Dogrun name', with: @dogrun.dogrun_name
    fill_in 'Image', with: @dogrun.image
    fill_in 'Pr', with: @dogrun.pr
    fill_in 'User', with: @dogrun.user_id
    click_on 'Create Dogrun'

    assert_text 'Dogrun was successfully created'
    click_on 'Back'
  end

  test 'updating a Dogrun' do
    visit dogruns_url
    click_on 'Edit', match: :first

    fill_in 'Address', with: @dogrun.address
    fill_in 'Dogrun name', with: @dogrun.dogrun_name
    fill_in 'Image', with: @dogrun.image
    fill_in 'Pr', with: @dogrun.pr
    fill_in 'User', with: @dogrun.user_id
    click_on 'Update Dogrun'

    assert_text 'Dogrun was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Dogrun' do
    visit dogruns_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Dogrun was successfully destroyed'
  end
end
