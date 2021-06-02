# GitBook Demo

This is a demo of the GitBook's Visitor Authentication feature. This is a public repository. Bear in mind that the code is not perfect and that the purpose of this repository is to showcase the workflow for the feature. 

You can see a live demo [here](https://gitbook-va.herokuapp.com/)

## How to use it? 

1. Create a new account with a random email and credentials. 
2. Visit the "docs" or "api reference link. 
3. Upon clicking one of those links you will see that the backend generates a Jason Web Token and this is appened to the URL. 
4. You are successfully redirected to a private documentation. 

## Authorization

You will find the authorization logic in the file auth_controller.rb

```
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
```
