require 'net/http'
class Mtl
    def self.get_data(image_url, gender)
        # url = "https://api.mirrorthatlook.com/v2/mirrorthatlook?image=https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTXe96mQzn26RObrVvwi01OVFSuenJvvdPvCrk3mAw_r_t9B7_I&usqp=CAU&gender=Male&limit=5"
        # response = RestClient.get(url)
        # response_body = response.body
        uri = URI('https://api.mirrorthatlook.com/v2/mirrorthatlook')

    query = URI.encode_www_form({
        # Request parameters
        'image' => image_url,
        'gender' => gender,
        'limit' => '12'
    })
    if query.length > 0
        if uri.query && uri.query.length > 0
            uri.query += '&' + query
        else
            uri.query = query
        end
    end
    key = Figaro.env.MTL
    # byebug
    request = Net::HTTP::Get.new(uri.request_uri)
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ''
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = key
    # Request body
    request.body = "{body}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
    response_body = response.body
    json_response = JSON.parse(response_body)
    clothes = json_response["result"][0]["products"].map do |product|
        {name: product["name"], price: product["price"], image_url: product["image"], link: product["affiliates"][0]["link"]}
    end
    # byebug

end
end