require "test_helper"

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @tweet = Tweet.new(content: "Lorem ipsum")
  end

  test "should not save tweet without content" do
    tweet = Tweet.new
    assert_not tweet.save, "Saved the tweet without a content"
  end

  test "should not save tweet with content length more than 140" do
    tweet = Tweet.new
    tweet.content = "a" * 141
    assert_not tweet.save, "Saved the tweet with content length more than 140"
  end

  test "associated tweets should be destroyed" do
    @tweet.save
    @tweet.comments.create!(content: "Lorem ipsum")
    assert_difference "Comment.count", -1 do
      @tweet.destroy
    end
  end
end
