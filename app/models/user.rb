class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :omniauthable

  has_many :practices
  has_many :competitionresults

  def self.find_for_facebook(auth,signed_in_resource=nil)
    user = User.find_by(email: auth.info.email, provider: auth.provider, userid: auth.uid)

    unless user
      user = User.new(
               email: auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
               provider: auth.provider,
               name: auth.extra.raw_info.name,
               userid: auth.uid,
               image_url: auth.info.image,
               password: Devise.friendly_token[0,20],
             )
      user.skip_confirmation!
      user.save(validate: false)
    end
    user
  end

  def self.find_for_twitter(auth,signed_in_resource=nil)
    user = User.find_by(email: auth.info.email, provider: auth.provider, userid: auth.uid)

    unless user
      user = User.new(
              email: auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
              provider: auth.provider,
              name: auth.info.nickname,
              userid: auth.uid,
              password: Devise.friendly_token[0,20],
       )
      user.skip_confirmation!
      user.save
    end
    user
  end

  def self.find_for_google(auth,signed_in_hash=nil)
    user = User.find_by(email: auth.info.email, provider: auth.provider, userid: auth.uid)

    unless user
      user = User.new(
              email: auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
              provider: auth.provider,
              name: auth.info.name,
              userid: auth.uid,
              password: Devise.friendly_token[0,20],
       )
      user.skip_confirmation!
      user.save(validate: false)
    end
    user
  end

  def self.find_for_instagram(auth,signed_in_hash=nil)
    user = User.find_by(email: auth.info.email, provider: auth.provider, userid: auth.uid)

    unless user
      user = User.new(
              email: auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
              provider: auth.provider,
              name: auth.info.name,
              userid: auth.uid,
              password: Devise.friendly_token[0,20],
             )
      user.skip_confirmation!
      user.save
    end
    user
  end

  def self.create_unique_string
    SecureRandom.uuid
  end
end
