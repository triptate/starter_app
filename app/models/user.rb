class User < ActiveRecord::Base
  extend FriendlyId
  extend TokenGenerator

  authenticates_with_sorcery!
  friendly_id :slug_options, use: :slugged

  validates :email, presence: true, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, presence: true, unless: :password_not_required

  attr_accessor :password_not_required

  def formatted_email
    %Q{"<#{email}>"}
  end


  private

  def should_generate_new_friendly_id?
    slug.nil? || email_changed?
  end

  def slug_options
    [:email_handle]
  end

  def email_handle
    email.split('@').first
  end

  def email_domain
    email.split('@').last
  end

  def token
    TokenGenerator.new
  end

end
