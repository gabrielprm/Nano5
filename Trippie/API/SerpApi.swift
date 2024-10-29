import UIKit

struct SerpApi: Codable {
    let events_results: [EventsResults]
}

struct EventsResults: Codable {
    let title: String
    let date: DateClass
    let address: [String]
    let link: String
    let description: String?
    let thumbnail: String
}

struct DateClass: Codable {
    let start_date, when: String
}

extension SerpApi {
    
    static func requestEvent(eventsViewController: EventsViewController) {
        let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
        var events: [Events] = []
        
        var city = eventsViewController.trip!.cidade!
        
        city = city.replacingOccurrences(of: " ", with: "%20")
        city = city.folding(options: .diacriticInsensitive, locale: .current)
        
        let key = "c4913f7568dc022db18a593cd8a753c11e62c562394687484029a6e1aef16a74"
        let urlSerpApi = "https://serpapi.com/search.json?engine=google_events&api_key=\(key)&q=\(city)"
        let url = URL(string: urlSerpApi)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("Error")
                return
            }
            
//            Printar o JSON por completo.
            do {
                let dictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]

                print(dictionary)
            } catch let error{
                print(error)
            }
            
            var result: SerpApi?
            
            do {
                result = try JSONDecoder().decode(SerpApi.self, from: data)
            } catch let error{
                print("Error \(error)")
            }
            
            guard let json = result else {
                return
            }
            
            for eventResult in json.events_results {
                let event = Events(context: context)
                
                event.titulo = eventResult.title
                event.thumbnail = eventResult.thumbnail
                event.descricao = eventResult.description ?? "No description"
                event.endereco = eventResult.address[1]
                event.isFavorite = false
                
                let dateString = eventResult.date.start_date
                let dateFormatter = DateFormatter()
                
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.dateFormat = "LLL dd"
                
                if let date = dateFormatter.date(from: dateString) {
                    event.dataInicio = date
                }
                
                events.append(event)
            }
            
            eventsViewController.events = events
            
            DispatchQueue.main.async {
                eventsViewController.tableView.reloadData()
            }
        })
        
        task.resume()
    }
    
}
