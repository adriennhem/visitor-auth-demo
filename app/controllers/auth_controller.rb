class AuthController < ApplicationController
    def encode_token
        # add some logic here to auth users
        space = params[:space]
        if current_user.authorized?
            payload = { data: 'test' }
            gitbook_sign_key = '2262c4b8-2c24-4e08-bc76-3e132b0a4e8c'
            token = JWT.encode payload, gitbook_sign_key, 'HS256'
            redirect_to "https://gitbook-demo-2.gitbook.io/#{space}/?jwt_token=#{token}"
        else
            redirect_to root_path, notice: "You are not authorized to access this content!"
        end
    end
end

