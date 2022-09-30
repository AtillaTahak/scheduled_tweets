class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    binding.irb
    return if tweet.published?

    return if tweet.publish_at > Time.now

    tweet.publish_to_twitter!
  end
end
