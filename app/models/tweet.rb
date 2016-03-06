class Tweet < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  has_many   :comments

  has_attached_file :movie, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :movie, content_type: ["image/jpg","image/jpeg","image/png"]
end