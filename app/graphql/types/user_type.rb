Types::UserType = GraphQL::ObjectType.define do
    name 'user'

    field :id, !types.ID
    field :email, !types.String
    field :password, !types.Int
    field :token, !types.String
    
end