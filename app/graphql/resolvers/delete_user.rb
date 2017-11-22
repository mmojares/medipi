class Resolvers::DeleteUser < GraphQL::Function
  argument :user_id, types.ID
  argument :email, types.String
  argument :password, types.String
  argument :name, types.String
  
  type  !types.String

  def call(_obj, args, _ctx)
    user_account = User.find(args[:user_id])
    return user_account.destroy if user_account
    GraphQL::ExecutionError.new("Cannot find id")
  end
end