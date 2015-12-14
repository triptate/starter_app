class User < ActiveRecord::Base
  extend FriendlyId
  extend TokenGenerator

  authenticates_with_sorcery!
  friendly_id :slug_options, use: [:slugged, :finders]


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
