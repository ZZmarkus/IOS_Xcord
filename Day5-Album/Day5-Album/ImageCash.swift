//
//  ImageCash.swift
//  Day5-Album
//
//  Created by iMac_15 on 2020. 7. 16..
//  Copyright © 2020년 KPU ios app dev. All rights reserved.
//

import UIKit


class ImageCache{
    static var cache : [String:UIImage] = [:]
    static func image(for str: String) -> UIImage?{
        return cache[str]
    }
    
    static func set(image: UIImage, for str: String){
        cache[str] = image
    }
    
}
