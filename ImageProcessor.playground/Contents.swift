//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")

let sharedFilterUtils = FilterUtils()

// Process the image!


// Instantiate the RGBAImage class

let rgbaImg = RGBAImage.init(image: image!)
var toEditImg = ToGrayScale().turnToGrayScale(rgbaImg!, withAlpha: false)
var toEditImg2 = ToGrayScale().turnToGrayScale(rgbaImg!, withAlpha: true)






// Create new UIImage for display

let newImage = toEditImg.toUIImage()

let newImage2 = toEditImg2.toUIImage()
