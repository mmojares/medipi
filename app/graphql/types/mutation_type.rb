Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  field :create_link, function: Resolvers::CreateLink.new
  field :createUser, function: Resolvers::CreateUser.new
  field :delete_user, function: Resolvers::DeleteUser.new
  field :sign_in_user, function: Resolvers::SignInUser.new
  field :create_table, function: Resolvers::CreateTable.new
  field :update_table, function: Resolvers::UpdateTable.new
  field :delete_table, function: Resolvers::DeleteTable.new

end
