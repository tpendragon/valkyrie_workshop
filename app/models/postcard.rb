class Postcard < Valkyrie::Resource
  attribute :id, Valkyrie::Types::ID.optional
  attribute :title, Valkyrie::Types::Set
  attribute :author, Valkyrie::Types::Set
end
