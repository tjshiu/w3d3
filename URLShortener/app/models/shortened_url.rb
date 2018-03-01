class ShortenedUrl < ApplicationRecord

  def self.random_code
    random = SecureRandom::urlsafe_base64
    while ShortenedUrl.exists?(random)
      random = SecureRandom::urlsafe_base64
    end
    random
  end

  def self.create_new_shortened_url(user, long_url)
    ShortenedUrl.create!(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id)
  end

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id
end
