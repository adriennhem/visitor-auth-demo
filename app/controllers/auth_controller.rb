class AuthController < ApplicationController
    def encode_token
        # add some logic here to auth users
        payload = { data: 'test' }
        gitbook_sign_key = '2262c4b8-2c24-4e08-bc76-3e132b0a4e8c'
        token = JWT.encode payload, gitbook_sign_key, 'HS256'
        redirect_to "https://gitbook-demo-2.gitbook.io/project-1/?jwt_token=#{token}"
    end
end
