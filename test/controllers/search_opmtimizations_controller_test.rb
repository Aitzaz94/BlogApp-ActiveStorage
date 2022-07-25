require "test_helper"

class SearchOpmtimizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_opmtimization = search_opmtimizations(:one)
  end

  test "should get index" do
    get search_opmtimizations_url
    assert_response :success
  end

  test "should get new" do
    get new_search_opmtimization_url
    assert_response :success
  end

  test "should create search_opmtimization" do
    assert_difference("SearchOpmtimization.count") do
      post search_opmtimizations_url, params: { search_opmtimization: { blog_id: @search_opmtimization.blog_id, city: @search_opmtimization.city, keyword: @search_opmtimization.keyword } }
    end

    assert_redirected_to search_opmtimization_url(SearchOpmtimization.last)
  end

  test "should show search_opmtimization" do
    get search_opmtimization_url(@search_opmtimization)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_opmtimization_url(@search_opmtimization)
    assert_response :success
  end

  test "should update search_opmtimization" do
    patch search_opmtimization_url(@search_opmtimization), params: { search_opmtimization: { blog_id: @search_opmtimization.blog_id, city: @search_opmtimization.city, keyword: @search_opmtimization.keyword } }
    assert_redirected_to search_opmtimization_url(@search_opmtimization)
  end

  test "should destroy search_opmtimization" do
    assert_difference("SearchOpmtimization.count", -1) do
      delete search_opmtimization_url(@search_opmtimization)
    end

    assert_redirected_to search_opmtimizations_url
  end
end
