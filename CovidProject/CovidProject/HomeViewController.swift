//
//  HomeViewController.swift
//  CovidProject
//
//  Created by Stephen Thompson on 4/18/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var covidStatData: CovidStat?
    
    @IBOutlet weak var deathCountTextLabel: UILabel!
    
    @IBOutlet weak var postiveCaseCountTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCovidStat()
    }
    
    func getCovidStatJSON(completion: @escaping (String?, Error?) -> Void) {
        let zipCd = User.currentUser?.zipCd
        let apiURL: String = "https://localcoviddata.com/covid19/v1/locations?zipCode=\(zipCd ?? "")"
        guard let cURL = URL(string: apiURL) else { return }
        let request = URLRequest(url: cURL)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let str = String(data: data!, encoding: .utf8) {
                completion(str, nil)
            }
        }.resume()
    }
    
    func getCovidStat() {
        getCovidStatJSON(completion: { covidStatJSON, error in
            if let covidStatJSON = covidStatJSON {
                let covidStatData = Data(covidStatJSON.utf8)
                let decoder = JSONDecoder()
                do {
                    self.covidStatData = try decoder.decode(CovidStat.self, from: covidStatData)
                    DispatchQueue.main.async {
                        self.deathCountTextLabel.text = "Death count for \(self.covidStatData!.zipCd): \(self.covidStatData!.counties[0].deathCt) people"
                        self.postiveCaseCountTextLabel.text = "Positive count for \(self.covidStatData!.zipCd): \(self.covidStatData!.counties[0].positiveCt) people"
                        
                    }
                } catch {
                    print(error)
                }
            }
        })
    }

}
