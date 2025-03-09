require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweets_url
    assert_response :success
  end
  
  test "should get new" do
    get new_tweet_url
    assert_response :success
  end
  
  test "should get show" do
    # You'll need a tweet to show
    tweet = tweets(:one) # Assuming you have fixtures
    get tweet_url(tweet)
    assert_response :success
  end
  
  test "should get edit" do
    tweet = tweets(:one) # Assuming you have fixtures
    get edit_tweet_url(tweet)
    assert_response :success
  end
end
