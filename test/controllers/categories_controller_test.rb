require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'sports')
    @user = User.create(username: 'Jhon', email: 'jhondoe@example.com', password: 'password', admin: true)
  end

  test 'should get categories index' do
    get categories_path(@category)
    assert_response :success
  end

  test 'should get new' do
    sign_in_as(@user, 'password')
    get new_category_path(@category)
    assert_response :success
  end

  test 'should get show' do
    get category_path(@category.id)
    assert_response :success
  end
end
