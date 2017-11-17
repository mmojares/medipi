class Resolvers::DeleteTable < GraphQL::Function
    # arguments passed as "args"
    argument :id, !types.ID
    argument :name, !types.String
    argument :quantity, !types.Int
  
    # return type from the mutation
    type  !types.ID
  
    # the mutation method
    # _obj - is parent object, which in this case is nil
    # args - are the arguments passed
    # _ctx - is the GraphQL context (which would be discussed later)
    def call(_obj, args, _ctx)
      delete_table = Table.find(args[:id])
      delete_table.destroy
    end
    
  end