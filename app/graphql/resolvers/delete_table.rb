class Resolvers::DeleteTable < GraphQL::Function
    # arguments passed as "args"
    argument :table_id, !types.ID
  
    # return type from the mutation
    type  !types.String
  
    # the mutation method
    # _obj - is parent object, which in this case is nil
    # args - are the arguments passed
    # _ctx - is the GraphQL context (which would be discussed later)
    def call(_obj, args, _ctx)
      delete_table = Table.find(args[:table_id])
      return delete_table.destroy if delete_table
      GraphQL::ExecutionError.new("Cannot find id")
    end
    
  end