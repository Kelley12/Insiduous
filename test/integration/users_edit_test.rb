require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test)
  end

  test "unsuccessful edit: name, email, password, password_confirmation" do
    log_in_as(@user)
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "foo@invalid",
                                    password:              "foo",
                                    password_confirmation: "bar" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>4}
  end

  test "unsuccessful edit: email, password, password_confirmation" do
    log_in_as(@user)
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "Example User",
                                    email: "example@user",
                                    password:              "foo",
                                    password_confirmation: "bar" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>3}
  end

  test "unsuccessful edit: name, password, password_confirmation" do
    log_in_as(@user)
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "example@user.net",
                                    password:              "foo",
                                    password_confirmation: "bar" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>3}
  end

  test "unsuccessful edit: name, email, password_confirmation" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "example@user",
                                    password:              "foobar",
                                    password_confirmation: "bar" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>3}
  end

  test "unsuccessful edit: name, email, password" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "example@user",
                                    password:              "foo",
                                    password_confirmation: "foo" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>3}
  end

  test "unsuccessful edit: name, email" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "example@user",
                                    password:              "foobar",
                                    password_confirmation: "foobar" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>2}
  end

  test "unsuccessful edit: name, password" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "example@user.net",
                                    password:              "foo",
                                    password_confirmation: "foo" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>2}
  end

  test "unsuccessful edit: email, password" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "Example User",
                                    email: "example@user",
                                    password:              "foo",
                                    password_confirmation: "foo" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>2}
  end

  test "unsuccessful edit: name, password_confirmation" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "example@user.net",
                                    password:              "foobar",
                                    password_confirmation: "foo" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>2}
  end

  test "unsuccessful edit: email, password_confirmation" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "Example User",
                                    email: "example@user",
                                    password:              "foobar",
                                    password_confirmation: "foo" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>2}
  end

  test "unsuccessful edit: password, password_confirmation" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "Example User",
                                    email: "example@user.net",
                                    password:              "bar",
                                    password_confirmation: "foo" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>2}
  end

  test "unsuccessful edit: name" do
    log_in_as(@user)
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "example@user.net",
                                    password:              "foobar",
                                    password_confirmation: "foobar" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>1}
  end

  test "unsuccessful edit: email" do
    log_in_as(@user)
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "Example User",
                                    email: "example@user",
                                    password:              "foobar",
                                    password_confirmation: "foobar" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>1}
  end

  test "unsuccessful edit: password" do
    log_in_as(@user)
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "Example User",
                                    email: "example@user.net",
                                    password:              "foo",
                                    password_confirmation: "foo" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>1}
  end

  test "unsuccessful edit: password_confirmation" do
    log_in_as(@user)
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "Example User",
                                    email: "example@user.net",
                                    password:              "foobar",
                                    password_confirmation: "foo" }
    assert_template 'users/edit'
    assert_select "div#error_explanation ul>li", {:count=>1}
  end

  test "successful edit" do
    log_in_as(@user)
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), user: { name:  name,
                                    email: email,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name,  name
    assert_equal @user.email, email
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), user: { name:  name,
                                    email: email,
                                    password:              "foobar",
                                    password_confirmation: "foobar" }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name,  name
    assert_equal @user.email, email
  end
end