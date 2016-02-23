class Tweet < ActiveRecord::Base
  acts_as_ordered_taggable_on :genre, :labels
  acts_as_taggable
end
