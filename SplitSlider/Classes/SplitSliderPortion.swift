//
//  SplitSliderPortion.swift
//  SplitSlider
//
//  Created by Tomas Friml on 28/06/17.
//
//
//  MIT License
//
//  Copyright (c) 2017 Tomas Friml
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//

public class SplitSliderPortion: NSObject {

    /// Minimal possible slider value
    public var min : CGFloat = 0 {
        didSet {
            if min > max {
                min = max
            } else {
                update()
            }
        }
    }
    
    /// Maximal possible slider value
    public var max : CGFloat = 100 {
        didSet {
            if max < min {
                max = min
            } else {
                update()
            }
        }
    }
    
    /// Step slider value
    public var step : CGFloat = 5 {
        didSet {
            if step > (max - min) {
                step = max - min
            } else {
                update()
            }
        }
    }
    
    /// Current slider value
    public var value : CGFloat = 0 {
        didSet {
            update()
        }
    }
    
    
    /// Size (diameter) of thumb
    public var thumbSize : CGFloat = 20 {
        didSet {
           updateThumbFrame()
        }
    }
    
    /// Should the thumb snap to closest step
    public var snapToStep : Bool = true
    
    /// Portion slider track
    open let track = SplitSliderTrack()

    /// Portion slider thumb
    open let thumb = SplitSliderThumb()
    
    
    /// Set thumb frame
    ///
    /// - Parameter frame: New frame for thumb
    public func setThumb(frame: CGRect) {
        thumb.frame = frame
        thumb.setNeedsLayout()
    }
    
    
    /// Update thumb frame (and portion value) based on
    /// point touched
    ///
    /// - Parameter location: Touch point
    public func updateThumb(location: CGPoint) {
        track.x = location.x
        value = round((min + track.highlightRatio * (max - min)) / step) * step
        
        updateThumbFrame()
    }
    
    /// Update thumb frame
    public func updateThumbFrame() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        var frame = thumb.frame
        frame.origin.x = track.x - thumbSize/2
        thumb.frame = frame
        
        track.setNeedsDisplay()
        thumb.setNeedsLayout()
        
        CATransaction.commit()
        
    }
    
    
    /// Update track frame
    ///
    /// - Parameter frame: Final frame
    public func updateTrack(frame: CGRect) {
        track.zeroOffset = thumbSize / 2
        track.frame = frame
        track.setNeedsLayout()
    }
    
    public override init() {
        super.init()
        
        update()
    }
    
    
    // MARK: - Private
    fileprivate func update() {
        track.setNeedsLayout()
        
        if value < min || value > max {
            value = Swift.min(max, Swift.max(value, min))
        }
        
        if snapToStep {
            let newValue = (value / step) * step
            if newValue != value {
                value = newValue
            }
        }
        
        track.highlightRatio = (value - min) / (max - min)
        
        updateThumbFrame()
    }
}
