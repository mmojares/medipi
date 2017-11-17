Types::TableType = GraphQL::ObjectType.define do
    name 'table'

    field :id, !types.ID
    field :name, !types.String
    field :quantity, !types.Int
    
end