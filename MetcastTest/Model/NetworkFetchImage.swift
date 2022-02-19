//
//  NetworkFetchImage.swift
//  MetcastTest
//
//  Created by Владимир Рубис on 19.02.2022.
//

import Foundation
import UIKit

class NetworkFetchImage {
    
    static let shared = NetworkFetchImage()
    
    func fetchImage(_ urlString: String, completionHandler: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
//                let image = UIImage(data: data ?? <#default value#>)
                completionHandler(UIImage(data: data!))
            }
        }
        task.resume()
    }
}
