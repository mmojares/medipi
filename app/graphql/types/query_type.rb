Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :tablelists, !types[Types::TableType] do
    resolve -> (obj,args,ctx){
      Table.all
    }
  end
  field :tablelist, Types::TableType do
    argument :table_id, !types.ID
    resolve -> (obj,args,ctx){
      Table.find(args["table_id"])
    }
  end

end
