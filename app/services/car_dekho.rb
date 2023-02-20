class CarDekho

    def fetch
        url = "http://localhost:3000/posts"
        response = RestClient.get(url, headers={})
    end

    def create
        url = "http://localhost:3000/posts"
        body = {
            post: {
                title: "This is from rest client",
                description: "thissssssss",
                category_id: 4
            }
        }

        headers = {
            authorization: 'Bearer eyJhY2Nlc3MtdG9rZW4iOiJkbmFOSldNUmd2QlBpY21NcW11elBRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6Ilg5UGVMa0hjOEw0V2pHZk5CT2QycWciLCJleHBpcnkiOiIxNjc3NzYwNDQyIiwidWlkIjoidGVzdEBlbWFpbC5jb20ifQ=='
        }

        begin
            response = RestClient.post(url, body, headers)
        rescue => e
            e.message
        end
    end
end
