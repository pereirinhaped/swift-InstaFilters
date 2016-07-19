//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")

// Process the image!


// Instantiate the RGBAImage class

let rgbaImg = RGBAImage.init(image: image!)

// Apply ToGrayScale Filter
var toEditImg = ToGrayScale().turnToGrayScale(rgbaImg!)
var toEditImg2 = ToGrayScale().turnToGrayScale(rgbaImg!, intensity: ToGrayScale.Intensity.Strong)
var toEditImg3 = ToGrayScale().turnToGrayScale(rgbaImg!, intensity: ToGrayScale.Intensity.Medium)
var toEditImg4 = ToGrayScale().turnToGrayScale(rgbaImg!, intensity: ToGrayScale.Intensity.Low)


// Create new UIImage for display

let newImage = toEditImg.toUIImage()
let newImage2 = toEditImg2.toUIImage()
let newImage3 = toEditImg3.toUIImage()
let newImage4 = toEditImg4.toUIImage()