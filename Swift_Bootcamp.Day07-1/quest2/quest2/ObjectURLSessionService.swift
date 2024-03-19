//
//  ObjectURLSessionService.swift
//  quest2
//
//  Created by Юсуп Оздоев on 18.01.2024.
//

import Foundation

class ObjectURLSessionService: IObjectService {
    var urlRequest: URLRequest
    
    func GetData(completion: @escaping (_ list: FlightList?) -> ()) {
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                do {
                    let decodedUsers = try JSONDecoder().decode(FlightList.self, from: data)
                    completion(decodedUsers)
                } catch let error {
                    print("Error decoding: ", error)
                }
            } else {
                print(response.statusCode)
                completion(nil)
            }
            
        }

        dataTask.resume()
    }
    
    init()  {
        let url = URL(string: "https://api.schiphol.nl/public-flights/flights?includedelays=false&page=0&sort=%2BscheduleTime")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("49f1f26f70e40f51f6fdc87b83af6f4e", forHTTPHeaderField: "app_key")
        urlRequest.setValue("f98fbb7f", forHTTPHeaderField: "app_id")
        urlRequest.setValue("v4", forHTTPHeaderField: "ResourceVersion")
        self.urlRequest = urlRequest
    }
}
