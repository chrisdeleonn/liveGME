//
//  ViewController.swift
//  liveGME
//
//  Created by Chris De Leon on 4/25/22.
//

import UIKit

import PlaygroundSupport
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://financialmodelingprep.com/api/v3/quote-short/GME?apikey=f06a4d316b9efb2fc94b1f8000f53f3d")
        
        var request = URLRequest(url: url!)

        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }

            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        }

        task.resume()
        PlaygroundPage.current.needsIndefiniteExecution = true
    }


}

