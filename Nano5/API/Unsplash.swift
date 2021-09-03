//
//  Unsplash.swift
//  Nano5
//
//  Created by Johnny Camacho on 02/09/21.
//

import UIKit

struct Unsplash: Codable {
    let results: [Result]
}

struct Result: Codable {
    let urls: Url
}

struct Url: Codable {
    let thumb: String
}

extension Unsplash {
    
    static func requestImage(cell: TripsTableViewCell) {
//        let city = "Rio%20De%20Janeiro"
        var city = cell.titleLabel.text!
        
        city = city.replacingOccurrences(of: " ", with: "%20")
        city = city.folding(options: .diacriticInsensitive, locale: .current)
        
        let key = "MhhlHI6wOceOY7nYiKoAwqZgUVtuw_IFdxrBE8BOEM0"
        let urlUnsplash = "https://api.unsplash.com/search/photos/?query=\(city)&per_page=1&client_id=\(key)"
        
        let task = URLSession.shared.dataTask(with: URL(string: urlUnsplash)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("error")
                return
            }
            
            var result: Unsplash?

            do {
                result = try JSONDecoder().decode(Unsplash.self, from: data)
            } catch {
                print("Erro 2")
            }

            guard let json = result else {
                return
            }
            
            let urlThumb = URL(string: json.results[0].urls.thumb)!
            let dataImage = try! Data(contentsOf: urlThumb)

            DispatchQueue.global(qos: .background).async {
                DispatchQueue.main.async {
                    cell.thumbImage.image = UIImage(data: dataImage)
                }
            }
        })
        
        task.resume()
    }
    
}
