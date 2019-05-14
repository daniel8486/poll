class PollSerializer < ActiveModel::Serializer
  has_many :options
  attributes :id,:description
end
