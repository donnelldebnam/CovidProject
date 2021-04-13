//
//  LocationViewController.swift
//  CovidProject
//
//  Created by Donnell Debnam on 4/11/21.
//

import UIKit

extension LocationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    }
}

extension LocationViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let location = locationData[indexPath.row]
        cell.textLabel?.text = location.name
        return cell
    }

}
    
class LocationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var locationData = [TestingLocation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getParsedTestingLocations()
    }
    
    func getTestingLocationsJSON(completion: @escaping (String?, Error?) -> Void) {
        let state = User.currentUser?.state
        let apiURL: String = "https://covid-19-testing.github.io/locations/\(state ?? "")/complete.json"
        guard let cURL = URL(string: apiURL) else { return }
        let request = URLRequest(url: cURL)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let str = String(data: data!, encoding: .utf8) {
                completion(str, nil)
            }
        }.resume()
    }
    
    func getParsedTestingLocations() {
        getTestingLocationsJSON(completion: { testLocationsJSON, error in
            if let testLocationsJSON = testLocationsJSON {
                let testLocationsData = Data(testLocationsJSON.utf8)
                let decoder = JSONDecoder()
                do {
                    self.locationData = try decoder.decode([TestingLocation].self, from: testLocationsData)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }

            }
        })
    }
        
}
