# Standard optimization technique to instantiate an object only once

class ApiClient
  def create_user(user)
    http_client.post '/create_user', user.to_json
  end

  # ...

  private

  def http_client
    @http_client ||= SomeHttpClient.new
  end
end
