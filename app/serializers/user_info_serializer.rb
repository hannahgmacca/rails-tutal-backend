class UserInfoSerializer < ActiveModel::Serializer
  # has_many :students
  # has_many :tutors
  include Rails.application.routes.url_helpers
  belongs_to :user, serializer: UserSerializer
  attributes :id, :first_name, :last_name, :about, :postcode, :main_image

  def main_image
    if object.main_image.attached?
      {
        url: rails_blob_url(object.main_image)
      }
    end
  end
end
