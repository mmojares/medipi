class Resolvers::DeleteUser < GraphQL::Function
    AuthProviderInput = GraphQL::InputObjectType.define do
      name 'deleteUser'
  
        argument :email, Types::AuthProviderEmailInput
    end
    argument :id, !types.ID
    argument :name, !types.String
    argument :authProvider, !AuthProviderInput
  
    type Types::UserType
  
    def call(_obj, args, _ctx)
        delete_user = User.find(args[:id])
        delete_user.destroy
    end
  end