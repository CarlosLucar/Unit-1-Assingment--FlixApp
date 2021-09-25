//
//  VideoViewController.swift
//  FlixApp
//
//  Created by Carlos Lucar on 9/22/21.
//

import UIKit
import WebKit


class VideoViewController: UIViewController, WKUIDelegate {

    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var id: NSNumber = 0.0
    var key: String = ""
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                    let results=dataDictionary["results"] as! NSArray
            
                let trailer = results[0] as! [String:Any]
                
                    
                    self.key = trailer["key"] as! String
                        
                    let myUrl = URL(string: "https://www.youtube.com/watch?v=\(self.key)")
                        
                    let myRequest = URLRequest(url: myUrl!)
                        
                    self.webView.load(myRequest)
                    
                
                
                    
                    
                
                
        // Do any additional setup after loading the view.
    
            }
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        }
        task.resume()
}
}
