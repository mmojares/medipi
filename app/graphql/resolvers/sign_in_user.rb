class Resolvers::SignInUser < GraphQL::Function
    
  argument :email, !types.String
  argument :password, !types.String
  
  type !types.String

  def call(_obj, args, _ctx)
      token = AuthenticateUser.new(args[:email],args[:password]).call
      return token.result if token.success?
      GraphQL::ExecutionError.new("Invalid email or password.")
  end
  
end