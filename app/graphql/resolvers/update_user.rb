class Resolvers::UpdateUser < GraphQL::Function
    # arguments passed as "args"
    argument :user_id, !types.ID
    argument :name, !types.String
    argument :email, !types.String
    argument :password, !types.String
  
    # return type from the mutation
    type Types::UserType
  
    # the mutation method
    # _obj - is parent object, which in this case is nil
    # args - are the arguments passed
    # _ctx - is the GraphQL context (which would be discussed later)
    def call(_obj, args, _ctx)

        update_table = User.find(args[:user_id])
        return update_table if update_table.update_attributes(name: args[:name], email: args[:email], password: args[:password])
        GraphQL::ExecutionError.new("invalid data")
    end
    
  end