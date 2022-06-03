require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:mike)
    # @post = Post.new(title: "First", description: "Second", user_id: @user.id)
    @post = @user.posts.new(title: "First", description: "Second")
  end

  test "Should be valid" do
    assert @post.valid?
  end

  test "user_id Should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title Should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end

  test "description Should be present" do
    @post.description = "     "
    assert_not @post.valid?
  end

  test "description lenght Should be present" do
    @post.description = "a" * 130
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end
end
