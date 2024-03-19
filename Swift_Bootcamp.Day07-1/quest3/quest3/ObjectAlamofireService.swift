//
//  ObjectAlamofireService.swift
//  quest3
//
//  Created by Юсуп Оздоев on 18.01.2024.
//

import Foundation
import Alamofire

class ObjectAlamofireService: IObjectService {
    var urlRequest: URLRequest
    
    func GetData(completion: @escaping (_ list: FlightList?) -> ()) {
        AF.request(urlRequest).responseDecodable(of: FlightList.self) { response in
            switch response.result {
                case .success(let dTypes):
                    completion(dTypes)
                case .failure(let error):
                    print(error)
                    completion(nil)
            }
        }
    }
    
    init() {
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
