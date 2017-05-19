//
//  ViewController.swift
//  Weather App
//
//  Created by Ross on 09/05/2017.
//  Copyright © 2017 Braaaaap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func submitButton(_ sender: Any) {

        
        UserDefaults.standard.set(textField.text, forKey: "city")

    }
    
    @IBOutlet weak var weatherReport: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let cityObject = UserDefaults.standard.object(forKey: "city"){
        
        if (cityObject as? String) != nil {
            
        //let textField.text = city
    
            
        let city = textField.text
        
        let url = URL(string: "http://www.weather-forecast.com/locations/" + city! + "/forecasts/latest")!
        
                weatherReport.loadRequest(URLRequest(url:url))
        
        }else{
            
            print("Sorry a valid City must be added")
            
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }


}

