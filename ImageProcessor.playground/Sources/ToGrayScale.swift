import Foundation

public class ToGrayScale: FilterUtils {
	
	public override init() {
		super.init()
	}
	
	public func turnToGrayScale(anImg: RGBAImage, withAlpha: Bool) -> RGBAImage {
		
		var newImage = anImg
		var pixel = newImage.pixels
		
		for index in 0..<newImage.pixels.count {
			let pixelAvg = getPixelAvgVal(pixel[index], AlphaOn: withAlpha)
			pixel[index].red = pixelAvg
			pixel[index].green = pixelAvg
			pixel[index].blue = pixelAvg
			if withAlpha {
				pixel[index].alpha = pixelAvg
			}
			newImage.pixels[index] = pixel[index]
		}
		return newImage
	}
	
}