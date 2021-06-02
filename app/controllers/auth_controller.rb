class AuthController < ApplicationController
    def encode_token
        if current_user.authorized?
            space = params[:space]
            payload = { data: 'test' }

            if space == "api-reference"
                gitbook_sign_key = "781cc582-1005-44c9-9b49-17d14470e439"
            elsif space == "docs"
                gitbook_sign_key = "01cab9b5-52ed-402d-8c0c-e44714828873"
            end

            token = JWT.encode payload, gitbook_sign_key, 'HS256'
            redirect_to "https://gitbook-demo-2.gitbook.io/#{space}/?jwt_token=#{token}"
        else
            redirect_to root_path, notice: "You are not authorized to access this content!"
        end
    end
end

