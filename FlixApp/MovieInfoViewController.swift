//
//  MovieInfoViewController.swift
//  FlixApp
//
//  Created by Carlos Lucar on 9/16/21.
//

import UIKit
import AlamofireImage

class MovieInfoViewController: UIViewController {

    
    @IBOutlet weak var backdrop: UIImageView!
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    
    @IBOutlet weak var vote: UILabel!
    
    
    var movie: [String: Any]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        movieTitle.text = (movie["title"] as! String)
        date.text = (movie["release_date"] as! String)
        
        synopsis.text = (movie["overview"] as! String)
        
        vote.text = "\(round( movie["vote_average"] as! Double * 10) / 10.0 )/10"
        
        
        
        let baseURL = "https://image.tmdb.org/t/p/original"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseURL + posterPath)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: baseURL + backdropPath)
        
        poster.af.setImage(withURL: posterUrl!)
        backdrop.af.setImage(withURL: backdropUrl!)
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VideoViewController = segue.destination as! VideoViewController
        
        VideoViewController.id = movie!["id"] as! NSNumber
        
        
        
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
