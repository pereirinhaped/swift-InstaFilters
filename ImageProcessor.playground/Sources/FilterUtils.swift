import Foundation

public class FilterUtils: NSObject {
	
	public override init() {
		super.init()
	}
	
	// Auxiliary method to calculate average channel values for entire image
	
	public func getAverageValues(image: RGBAImage) -> [UInt8] {
		
		let totalPixels = image.pixels.count
		var pixel = image.pixels
		
		var totalRed: Int = 0
		var totalGreen: Int = 0
		var totalBlue: Int = 0
		var totalAlpha: Int = 0
		
		for index in 0..<totalPixels {
			totalRed += Int(pixel[index].red)
			totalGreen += Int(pixel[index].green)
			totalBlue += Int(pixel[index].blue)
			totalAlpha += Int(pixel[index].alpha)
		}
		
		let averageValues: [UInt8] = [UInt8(totalRed/totalPixels),
		                              UInt8(totalGreen/totalPixels),
		                              UInt8(totalBlue/totalPixels),
		                              UInt8(totalAlpha/totalPixels)]
		return averageValues
	}
	
	// Auxiliary method for average value per pixel
	
	public func getPixelAvgVal(pixel: Pixel, AlphaOn withAlpha: Bool) -> UInt8 {
		
		let averageValue: UInt8
		
		let red = pixel.red
		let green = pixel.green
		let blue = pixel.blue
		let alpha = pixel.alpha
		
		if withAlpha {
			let total = Int(red) + Int(green) + Int(blue) + Int(alpha)
			averageValue = UInt8(total/4)
		} else {
			let total = Int(red) + Int(green) + Int(blue)
			averageValue = UInt8(total/3)
		}
		
		return averageValue
	}
	
}