require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # 'assert 조건'는 조건이 실행되면 에러 발생 안되는 거고 'refute 조건'은 조건이 실행이 안되면 에러발생이 안되는 것이다.
  # assert는 실제로 코드가 작성이 되있고 확인할 때 주로 사용한다.
  # TDD 같은 경우에는 실제로 test가 모두 fail이 나오도록 하고 test가 모두 true가 되겠끔 코딩하는 것이다.

  test "Post의 title은 반드시 2글자 이상이어야 한다." do
    post = Post.new(title: "ㅁㅁㅁ", content: "aaaa")
    assert post.save
  end

  test "Post의 title은 반드시 100글자 이하이어야 한다." do
    post = Post.new(title: "")
    assert post.save   # 옆에꺼의 bdd 형태 : it { should post.save } / 옆에꺼는 tdd형태
  end



  test "Post의 content는 반드시 2글자 이상이어야 한다." do
    post = Post.new(content: "as")
    refute post.save
  end

  test "Post의 content는 반드시 500글자 이하이어야 한다." do
    post = Post.new(content: Faker::Lorem.words(300))
    refute post.save
  end

end

# post model
# 1. title은 반드시 nil이 아니어야 한다.
# 2. title은 반드시 2글자 이상이어야 한다.
# 3. title은 반드시 100글자 이하이어야 한다.
# 4. content는 반드시 nil이 아니어야 한다.
# 5. content는 반드시 2글자 이상이어야 한다.
# 6. content는 반드시 500글자 이하이어야 한다.
