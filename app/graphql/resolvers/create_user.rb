class Resolvers::CreateUser < GraphQL::Function
    argument :email, types.String
    argument :password, types.String
    argument :name, types.String
  
    type Types::UserType
  
    def call(_obj, args, _ctx)

      user = User.new(email: args[:email],password: args[:password],name: args[:name])
      return user if user.save
      GraphQL::ExecutionError.new("Invalid data")
    end
  end