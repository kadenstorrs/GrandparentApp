//
//  NetworkController.swift
//  PillBoxView
//
//  Created by Kaden Storrs on 1/21/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import Foundation

class MedsItemController {
    
    func fetchMedInfo(searchTerm: String, completion: @escaping ([Packaging]?)-> Void) {
        let baseURL = URL(string: "https://api.fda.gov/drug/ndc.json?search=brand_name:%22\(searchTerm)%22")
        guard let url = baseURL else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let data = data, let string = String(data: data, encoding: .utf8) {
                print("This line ran through")
                print(data)
                print(string)
            }
            
            let decoder = JSONDecoder()
            if let data = data, let medItems = try? decoder.decode(Meds.self, from: data) {
                completion(medItems.results)
            } else {
                print("Whelp this sucks")
                print(url)
                completion(nil)
                return
            }
        }
        task.resume()
    }
}
