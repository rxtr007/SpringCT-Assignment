//
//  LoginViewModel.swift
//  SpringCT-Assignment
//
//  Created by Sachin Ambegave on 10/01/22.
//

import Foundation

struct LoginViewModel {
    
    typealias navigateToHomeScreenClosure = (User?, Bool) -> Void
    
    func login(with user: LoginInputDTO, completion: @escaping navigateToHomeScreenClosure) {
        guard let url = URL(string: "http://5d80a75f99f8a20014cf9661.mockapi.io/api/login") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else { completion(nil, false); return }
            guard let data = data else { completion(nil, false); return }
            
            do {
                let userModel = try JSONDecoder().decode(User.self, from: data)
                completion(userModel, true)
            }
            catch let error {
                completion(nil, false)
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
