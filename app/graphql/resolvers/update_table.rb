class Resolvers::UpdateTable < GraphQL::Function
    # arguments passed as "args"
    argument :table_id, !types.ID
    argument :name, !types.String
    argument :quantity, !types.Int
  
    # return type from the mutation
    type Types::TableType
  
    # the mutation method
    # _obj - is parent object, which in this case is nil
    # args - are the arguments passed
    # _ctx - is the GraphQL context (which would be discussed later)
    def call(_obj, args, _ctx)

        update_table = Table.find(args[:table_id])
        return update_table if update_table.update_attributes(name: args[:name], quantity: args[:quantity])
        GraphQL::ExecutionError.new("invalid data")
    end
    
  end