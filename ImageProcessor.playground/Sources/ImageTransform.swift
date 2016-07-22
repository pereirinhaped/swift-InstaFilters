/*
 * Code by Pedro Pereirinha
 * iOS App Development with Swift Spec
 *	   by University of Toronto
 * Introduction To Swift Programming
 *  Final - Peer Graded Assignment
 */

import UIKit

public struct ImageTransform {
	
	var tgtImg: Filters
	
	
	public var filterArray: [FiltersToApply: Filters.Intensity]
	
	public enum FiltersToApply {
		case GrayScale
		case Transparency
		case HighKey
		case LowKey
		case Contrast
	}
	
	public init(tgtImg: RGBAImage, filterArray: [FiltersToApply: Filters.Intensity]) {
		self.tgtImg = Filters(anImg: tgtImg)
		self.filterArray = filterArray
	}
	
	public func process() -> UIImage {
		
		var tmpImg = tgtImg
		
		for filter in filterArray.keys {
			switch filter {
			case .GrayScale:
				tmpImg = tmpImg.toGray(filterArray[filter]!)
			case .Transparency:
				tmpImg = tmpImg.transparency(filterArray[filter]!)
			case .HighKey:
				tmpImg = tmpImg.hiKey(filterArray[filter]!)
			case .LowKey:
				tmpImg = tmpImg.lowKey(filterArray[filter]!)
			case .Contrast:
				tmpImg = tmpImg.contrast(filterArray[filter]!)
			}
		}
		return tmpImg.process()
	}
	
}