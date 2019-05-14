class VoteSerializer < ActiveModel::Serializer
  belongs_to :option
  attributes :id
end
