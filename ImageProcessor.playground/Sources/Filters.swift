/*
 * Code by Pedro Pereirinha
 * iOS App Development with Swift Spec
 *	   by University of Toronto
 * Introduction To Swift Programming
 *  Final - Peer Graded Assignment
 */

import UIKit

public class Filters: FilterUtils {
	
	var tgtImg: RGBAImage
	
	public init(anImg: RGBAImage) {
		self.tgtImg = anImg
	}
	
	// Process and return image
	public func process() -> UIImage {
		return tgtImg.toUIImage()!
	}
	
	// Intensity for filter application
	public enum Intensity: Float {
		case Low
		case Medium
		case Strong
		}
	
	// Gray Scale Filter
	public func toGray(intensity: Intensity) -> Filters {
		var factor: Float {
			switch intensity {
			case .Low:
				return 0.6
			case .Medium:
				return 0.75
			case .Strong:
				return 1
			}
		}
		
		var pixel = tgtImg.pixels
		
		for index in 0..<pixel.count {
			let pixelAvg = getPixelAvgVal(pixel[index], AlphaOn: false)
			pixel[index].red = UInt8(max(0,min(255,Float(pixelAvg) * factor + Float(pixel[index].red) * (1 - factor))))
			pixel[index].green = UInt8(max(0,min(255,Float(pixelAvg) * factor + Float(pixel[index].green) * (1 - factor))))
			pixel[index].blue = UInt8(max(0,min(255,Float(pixelAvg) * factor + Float(pixel[index].blue) * (1 - factor))))
			
			tgtImg.pixels[index] = pixel[index]
		}
		
		return self
	}
	
	// Transparency Filter
	public func transparency(intensity: Intensity) -> Filters {
		
		var factor: Float {
			switch intensity {
			case .Low:
				return 0.1
			case .Medium:
				return 0.3
			case .Strong:
				return 0.5
			}
		}
		
		var pixel = tgtImg.pixels
		
		for index in 0..<pixel.count {
			let pixelAvg = getAverageValues(tgtImg)
			pixel[index].alpha = UInt8(max(0,min(255,Float(pixelAvg.last!) * (1 - factor))))
			tgtImg.pixels[index] = pixel[index]
		}
		
		return self
	}
	
	// Hi-Key Filter
	public func hiKey(intensity: Intensity) -> Filters {
		
		var factor: Float {
			switch intensity {
			case .Low:
				return 1.2
			case .Medium:
				return 1.3
			case .Strong:
				return 1.5
			}
		}
		
		var pixel = tgtImg.pixels
		
		for index in 0..<pixel.count {
			pixel[index].red = UInt8(max(0,min(255,Float(pixel[index].red) * factor)))
			pixel[index].green = UInt8(max(0,min(255,Float(pixel[index].green) * factor)))
			pixel[index].blue = UInt8(max(0,min(255,Float(pixel[index].blue) * factor)))
			
			tgtImg.pixels[index] = pixel[index]
		}
		
		return self
	}
	
	// Low-Key Filter
	public func lowKey(intensity: Intensity) -> Filters {
		
		var factor: Float {
			switch intensity {
			case .Low:
				return 0.9
			case .Medium:
				return 0.7
			case .Strong:
				return 0.55
			}
		}
		
		var pixel = tgtImg.pixels
		
		for index in 0..<pixel.count {
			pixel[index].red = UInt8(max(0,min(255,Float(pixel[index].red) * factor)))
			pixel[index].green = UInt8(max(0,min(255,Float(pixel[index].green) * factor)))
			pixel[index].blue = UInt8(max(0,min(255,Float(pixel[index].blue) * factor)))
			
			tgtImg.pixels[index] = pixel[index]
		}
		
		return self
	}
	
	// Contrast Filter
	public func contrast(intensity: Intensity) -> Filters {
		
		var factor: Float {
			switch intensity {
			case .Low:
				return 1.1
			case .Medium:
				return 1.2
			case .Strong:
				return 1.3
			}
		}
		
		var pixel = tgtImg.pixels
		
		let imgRGBAvg = getOverallAverage(tgtImg)
		
		for index in 0..<pixel.count {
			let pixelAvg = getPixelAvgVal(pixel[index], AlphaOn: false)
			
			if pixelAvg >= imgRGBAvg {
				pixel[index].red = UInt8(max(0,min(255,Float(pixel[index].red) * factor)))
				pixel[index].green = UInt8(max(0,min(255,Float(pixel[index].green) * factor)))
				pixel[index].blue = UInt8(max(0,min(255,Float(pixel[index].blue) * factor)))
			} else {
				pixel[index].red = UInt8(max(0,min(255,Float(pixel[index].red) / factor)))
				pixel[index].green = UInt8(max(0,min(255,Float(pixel[index].green) / factor)))
				pixel[index].blue = UInt8(max(0,min(255,Float(pixel[index].blue) / factor)))
			}
			
			
			
			
			tgtImg.pixels[index] = pixel[index]
		}
		
		return self
	}
}