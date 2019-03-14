//
//  UIImageExtension.swift
//  btown-rides-riders
//
//  Created by Daniel Jones on 2/6/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import Parse

extension UIImageView {
    //In case Parse gets removed, this will make it so we can pass any sort of file to the image view, and the only place we have to change in code, should just be here.
    //It keeps the program from being dependent upon a single backend, where if we got rid of Parse, then all of our PFImageViews would break. Now, we aren't dependent upon them.
    //We can load an UIImageView from literally AnyObject
    func loadFromFile(_ file: AnyObject?) {
        if let parseFile = file as? PFFileObject {
            retrieveParseData(parseFile)
        }
    }
    
    fileprivate func retrieveParseData(_ file: PFFileObject) {
        file.getDataInBackground(block: { (data, error) in
            if let data = data {
                self.loadImageFromData(data)
            } else {
                print("error")
            }
        })
    }
    
    fileprivate func loadImageFromData(_ data: Data) {
        self.image = UIImage(data: data)
    }
}
