class UserInfoSerializer < ActiveModel::Serializer
  # has_many :students
  # has_many :tutors
  belongs_to :user, serializer: UserSerializer
  attributes :id, :first_name, :last_name, :about, :suburb
end
