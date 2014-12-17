class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :message

  belongs_to :user
end
