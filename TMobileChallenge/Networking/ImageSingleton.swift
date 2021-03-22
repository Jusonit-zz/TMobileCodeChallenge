//
//  ImageSingleton.swift
//  TMobileChallenge
//
//  Created by Rave Bizz on 3/20/21.
//

import UIKit

struct ImageSingle {
    
    //Singleton requirements
    static let shared = ImageSingle()
    private init () {}
    
    //Cache
    let cache: NSCache<NSString, UIImage> = NSCache()
    
    
    //Functions (setImage, getImage, runImage)---------
    
    //setImage
    func setImage(key: NSString, image: UIImage) {
        self.cache.setObject(image, forKey: key)
    }
    //getImage
    func getImage(key: NSString) -> UIImage? {
        return self.cache.object(forKey: key)
    }
    //runImage
    func runImage(from urlString: String, completionHandler: @escaping (UIImage) -> ()){
        if urlString.contains(".jpg") {
            guard let url = URL(string: urlString) else {return}
            let postImageLink = urlString as NSString
            if let cachedImage = self.getImage(key: postImageLink) {
                DispatchQueue.main.async {
                    completionHandler(cachedImage)
                }
            } else {
                guard let placeholder = UIImage(named: "loading") else {return}
                DispatchQueue.main.async {
                    completionHandler(placeholder)
                }
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            completionHandler(image)
                        }
                        self.cache.setObject(image, forKey: urlString as NSString)
                    }
                }
                task.resume()
            }
        }
    }
}
