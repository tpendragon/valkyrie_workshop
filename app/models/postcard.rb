class Postcard < Valkyrie::Resource
  ## Every Resource which will be persisted needs an ID
  attribute :id, Valkyrie::Types::ID.optional
  attribute :title, Valkyrie::Types::Set
  attribute :author, Valkyrie::Types::Set
  ## Member IDs is a special property. It's ordered, and has special queries.
  ## The name is important.
  attribute :member_ids, Valkyrie::Types::Array
end
