module Docs
  module V1
    module Login
      extend Dox::DSL::Syntax

      document :api do
        resource 'Login' do
        endpoint '/login'
        group 'Login'
        end
      end

      document :create do
        action 'Index a session'
      end

      document :destroy do
        action 'Destroy a session'
      end
    end
  end
end
