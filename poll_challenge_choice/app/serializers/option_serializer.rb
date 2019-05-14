class OptionSerializer < ActiveModel::Serializer
  #belongs_to :poll
  has_many :votes
  attributes :id, :content
end
