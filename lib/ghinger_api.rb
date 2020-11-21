module GhingerApi

  class Connect
    HEADER={'Content-Type'=>'application/json','timeout'=>'180'}
    URL = "http://10.105.85.78:6099"
    # live port 7064

    def connection
      Faraday.new(:url => URL, :headers => HEADER, :ssl => {:verify => false}) do |faraday|
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end