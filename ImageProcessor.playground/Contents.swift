//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")

// Process the image!

// Apply ToGrayScale Filter
let filteredImg1 = ToGrayScale().applyFilter(image!)
let filteredImg2 = ToGrayScale().applyFilter(image!, intensity: .Strong)
let filteredImg3 = ToGrayScale().applyFilter(image!, intensity: .Medium)
let filteredImg4 = ToGrayScale().applyFilter(image!, intensity: .Low)
