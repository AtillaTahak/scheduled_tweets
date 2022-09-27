class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: {minimum:1, maximum:280} ,presence: true
  validates :twitter_account_id, presence: true
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= Time.now
  end
  def published?
    tweet_id?
  end
end
