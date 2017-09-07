//
//  ViewController.swift
//  Placeholder
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadImage(url: "https://static.pexels.com/photos/66284/winter-nature-season-trees-66284.jpeg")
    
    }
    
    func loadImage(url: String) {
        
        let url = NSURL(string: url)
        
        self.imageView.loading()

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let data = NSData(contentsOf: url! as URL) {
                DispatchQueue.main.async {
                    self?.imageView.finishLoading(image: UIImage(data: data as Data)!)
                }
            }
            else {
                DispatchQueue.main.async {
                    self?.imageView.finishLoading()
                }
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

