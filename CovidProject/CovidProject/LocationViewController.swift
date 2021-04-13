//
//  LocationViewController.swift
//  CovidProject
//
//  Created by Donnell Debnam on 4/11/21.
//

import UIKit

class LocationViewController: UIViewController {
            
    override func viewDidLoad() {
        super.viewDidLoad()
        parseTestingLocations()
    }
            
    func getTestingLocationsJSON(locationCompletionHandler: @escaping (String?, Error?) -> Void) {
        let state = User.currentUser?.state
        let apiURL: String = "https://covid-19-testing.github.io/locations/\(state ?? "")/complete.json"
        guard let cURL = URL(string: apiURL) else { return }
        let request = URLRequest(url: cURL)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let str = String(data: data!, encoding: .utf8) {
                locationCompletionHandler(str, nil)
            }
        }.resume()
    }
    
    func parseTestingLocations() {
        getTestingLocationsJSON(locationCompletionHandler: { testLocationsJSON, error in
            if let testLocationsJSON = testLocationsJSON {
                let testLocationsData = Data(testLocationsJSON.utf8)
                let decoder = JSONDecoder()
                do {
                    let testLocations = try decoder.decode([TestingLocation].self, from: testLocationsData)
                    print(testLocations)
                } catch {
                    print(error)
                }
            }
        })
    }
        
}
