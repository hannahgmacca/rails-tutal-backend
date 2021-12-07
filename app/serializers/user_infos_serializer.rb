class UserInfosSerializer < ActiveModel::Serializer
  has_many :students
  has_many :tutors
  attributes :id, :first_name, :last_name, :about, :suburb
end
