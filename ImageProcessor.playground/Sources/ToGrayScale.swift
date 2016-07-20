import UIKit

public class ToGrayScale: Filter {
	
	public override init() {
		super.init()
	}
	
	public enum Intensity: Float {
		case Low
		case Medium
		case Strong
		}
	
	public func applyFilter(anImg: UIImage) -> UIImage {
		
		var newImage = RGBAImage(image: anImg)
		
		var pixel = newImage!.pixels
		
		for index in 0..<newImage!.pixels.count {
			let pixelAvg = getPixelAvgVal(pixel[index], AlphaOn: false)
			pixel[index].red = pixelAvg
			pixel[index].green = pixelAvg
			pixel[index].blue = pixelAvg
			newImage!.pixels[index] = pixel[index]
		}
		let outputImage = newImage!.toUIImage()

		return outputImage!
	}
	
	public func applyFilter(anImg: UIImage, intensity: Intensity) -> UIImage {
		
		var newImage = RGBAImage(image: anImg)
		var pixel = newImage!.pixels
		var factor: Float
		
		switch intensity {
		case .Low:
			factor = 0.6
		case .Medium:
			factor = 0.75
		case .Strong:
			factor = 1
		}
		
		for index in 0..<newImage!.pixels.count {
			let pixelAvg = getPixelAvgVal(pixel[index], AlphaOn: false)
			pixel[index].red = UInt8(Float(pixelAvg) * factor + Float(pixel[index].red) * (1 - factor))
			pixel[index].green = UInt8(Float(pixelAvg) * factor + Float(pixel[index].green) * (1 - factor))
			pixel[index].blue = UInt8(Float(pixelAvg) * factor + Float(pixel[index].blue) * (1 - factor))
			pixel[index].alpha = UInt8(Float(pixelAvg) * factor + Float(pixel[index].alpha) * (1 - factor))
			
			newImage!.pixels[index] = pixel[index]
		}
		let outputImage = newImage!.toUIImage()
		
		return outputImage!
	}
	
}