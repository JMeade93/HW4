class User < ActiveRecord::Base
    
    def create_user! (attributes)
        attributes.merge!(session_token: SecureRandom.base64)
        @user = User.create!(attributes)
    end
    
end
