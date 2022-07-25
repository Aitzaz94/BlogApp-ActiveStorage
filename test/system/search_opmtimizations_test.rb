require "application_system_test_case"

class SearchOpmtimizationsTest < ApplicationSystemTestCase
  setup do
    @search_opmtimization = search_opmtimizations(:one)
  end

  test "visiting the index" do
    visit search_opmtimizations_url
    assert_selector "h1", text: "Search opmtimizations"
  end

  test "should create search opmtimization" do
    visit search_opmtimizations_url
    click_on "New search opmtimization"

    fill_in "Blog", with: @search_opmtimization.blog_id
    fill_in "City", with: @search_opmtimization.city
    fill_in "Keyword", with: @search_opmtimization.keyword
    click_on "Create Search opmtimization"

    assert_text "Search opmtimization was successfully created"
    click_on "Back"
  end

  test "should update Search opmtimization" do
    visit search_opmtimization_url(@search_opmtimization)
    click_on "Edit this search opmtimization", match: :first

    fill_in "Blog", with: @search_opmtimization.blog_id
    fill_in "City", with: @search_opmtimization.city
    fill_in "Keyword", with: @search_opmtimization.keyword
    click_on "Update Search opmtimization"

    assert_text "Search opmtimization was successfully updated"
    click_on "Back"
  end

  test "should destroy Search opmtimization" do
    visit search_opmtimization_url(@search_opmtimization)
    click_on "Destroy this search opmtimization", match: :first

    assert_text "Search opmtimization was successfully destroyed"
  end
end
