require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup: name, email, password, password_confirmation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation ul>li", {:count=>4}
  end

  test "invalid signup: email, password, password_confirmation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "Invalid User",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation ul>li", {:count=>3}
  end

  test "invalid signup: name, password, password_confirmation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid.net",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation ul>li", {:count=>3}
  end

  test "invalid signup: name, email, password_confirmation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foobar",
                               password_confirmation: "foo" }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation ul>li", {:count=>3}
  end

  test "invalid signup: name, email" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foobar",
                               password_confirmation: "foobar" }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation ul>li", {:count=>2}
  end

  test "invalid signup: name" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid.net",
                               password:              "foobar",
                               password_confirmation: "foobar" }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation ul>li", {:count=>1}
  end

  test "invalid signup: email" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "Invalid User",
                               email: "user@invalid",
                               password:              "foobar",
                               password_confirmation: "foobar" }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation ul>li", {:count=>1}
  end

  test "invalid signup: password, password_confirmation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "Invalid User",
                               email: "user@invalid",
                               password:              "foobar",
                               password_confirmation: "foobar" }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation ul>li", {:count=>1}
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
  end
end
