class RunFriend < ApplicationRecord
  belongs_to :follow, class_name: "user"
  belongs_to :followed, class_name: "user"
end
