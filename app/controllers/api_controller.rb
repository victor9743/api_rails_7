class ApiController < ApplicationController
    # necessário adicionar a gem httparty no gemfile
    def user_api
        url = "https://fakestoreapi.com/users"

        @users = call_rest_api(url)
    end

    def user_api_2
        url = "https://fakestoreapi.com/users"
        @image = "https://i.pravatar.cc/"
        @users = call_rest_api(url)
    end

    def show_user_details
        redirect_to load_user_details_path(1)
    end

    def load_user_details
        id = params[:id].to_i

        if id < 1 || id > 10
            redirect_to load_user_details_path(1)
        end

        response = HTTParty.get("https://fakestoreapi.com/users/#{id}")

        if response.success?
            @user = response
        end
    end

    def call_rest_api(url)
        response = HTTParty.get(url)

        return response.success? ? response : []
    end
end
