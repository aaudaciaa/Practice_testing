class Post < ActiveRecord::Base
  validates :title, presence: true, # presence: true 하면 post가 nil일 경우 test에서 false를 반환하고 nil이 아닐 경우 true를 반환한다.
                    length: { minimum: 2, maximum: 100 }
                    
  validates :content, presence: true,
                      length: { minimum: 2, maximum: 500}
end
