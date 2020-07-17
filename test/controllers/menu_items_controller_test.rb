require 'test_helper'

class MenuItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_item = menu_items(:one)
  end

  # test 'should get new' do
  #   get new_menu_item_url
  #   assert_response :success
  # end

  # test 'should create menu_item' do
  #   assert_difference('MenuItem.count') do
  #     post menu_items_url, params: { menu_item: {} }
  #   end

  #   assert_redirected_to menu_item_url(MenuItem.last)
  # end

  # test 'should get edit' do
  #   get edit_menu_item_url(@menu_item)
  #   assert_response :success
  # end

  # test 'should update menu_item' do
  #   patch menu_item_url(@menu_item), params: { menu_item: {} }
  #   assert_redirected_to menu_item_url(@menu_item)
  # end

  # test 'should destroy menu_item' do
  #   assert_difference('MenuItem.count', -1) do
  #     delete menu_item_url(@menu_item)
  #   end

  #   assert_redirected_to menu_items_url
  # end
end
