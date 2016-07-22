/*
 * Code by Pedro Pereirinha
 * iOS App Development with Swift Spec 
 *	   by University of Toronto
 * Introduction To Swift Programming
 *  Final - Peer Graded Assignment
 */


import UIKit

let image = RGBAImage(image: UIImage(named: "sample")!)
let filterArray: [ImageTransform.FiltersToApply: Filters.Intensity]

/* Choose filters to apply by choosen order with respective intensity
 * Available filters:
 * - GrayScale
 * - Transparency
 * - ShapeContrast
 * - LowKey
 * - HiKey
 *
 * Available intensities:
 * - Low
 * - Medium
 * - Strong
 */

// Exemple Filter Chain: GrayScale/Medium -> Contrast/ High -> HiKey/Low

filterArray = [
	.GrayScale: .Strong,
	.Contrast: .Medium ,
	.HighKey: .Low
	]

// Print Original Image
let originalImage = UIImage(named: "sample")

// Print Processed Image
let processedImage = ImageTransform(tgtImg: image!, filterArray: filterArray).process()
