//
//  Restaurant Model.swift
//  Try
//
//  Created by Tejasav Khattar on 11/07/19.
//  Copyright © 2019 Tejasav Khattar. All rights reserved.
//

//struct is preferred over class in swift as it is passed by refrence whereas aclass is passed by value

import UIKit

struct User {
    var name: String?
    var email: String?
    
    init() {
        
    }
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    func getUserWithObject(object: [String: Any]) -> User {
        var user = User()
        if let name = object["name"] as? String {
            user.name = name
        }
        if let email = object["email"] as? String {
            user.email = email
        }
        return user
    }
}

class Users: NSObject {

    override init() {
       super.init()
    }
    
    func getImage(urlString: String, completionHandler: @escaping (Data) -> () ){
        if let url = URL(string: urlString) {
            let dataTask = URLSession.shared.dataTask(with: url) {(data,response, error) in
                guard let data = data else { return}
                
                completionHandler(data)
            }
            dataTask.resume()
        }
    }
    
    
    func getData(urlString: String, completionHandler: @escaping ([User]) -> () ){
        var users: [User] = []
        
        if let url = URL(string: urlString) {
            let dataTask = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                let jsonData = self.convertToDictionary(data: data)
                
                guard let parsedJsonData = jsonData else {return}
                for object in parsedJsonData {
                    let user = User()
                    users.append(user.getUserWithObject(object: object))
                }
                completionHandler(users)
                //print(String(data: data, encoding: .utf8)!)
            }
            dataTask.resume()
        }
    }
    
    
    
    func convertToDictionary(data: Data?) -> [[String: Any]]? {
        guard let data = data else { return nil }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func convertToDictionary1(data: Data?) -> [String: Any]? {
        guard let data = data else { return nil }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

