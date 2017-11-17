class Resolvers::CreateTable < GraphQL::Function
    # arguments passed as "args"
    argument :name, !types.String
    argument :quantity, !types.Int
  
    # return type from the mutation
    type Types::TableType
  
    # the mutation method
    # _obj - is parent object, which in this case is nil
    # args - are the arguments passed
    # _ctx - is the GraphQL context (which would be discussed later)
    def call(_obj, args, _ctx)
      Table.create!(
        name: args[:name],
        quantity: args[:quantity],
      )
    end
    
  end