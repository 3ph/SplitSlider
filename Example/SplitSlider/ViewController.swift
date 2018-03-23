//
//  ViewController.swift
//  SplitSlider
//
//  Created by Tomas Friml on 06/22/2017.
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

import SplitSlider

class ViewController: UIViewController {

    @IBOutlet weak var splitSlider: SplitSlider!
    @IBOutlet weak var snapToStep: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitSlider.delegate = self
        splitSlider.labelFont = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        splitSlider.left.step = 30
        
    }
    @IBAction func snapToStepToggle(_ sender: Any) {
        if let toggle = sender as? UISwitch {
            splitSlider.snapToStep = toggle.isOn
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : SplitSliderDelegate {
    func slider(_ slider: SplitSlider, didSelect portion: SplitSliderPortion?) {
        let portionString = portion == slider.left ? "left" : "right"
        NSLog("Selected part: \(portion == nil ? "none" : portionString)")
    }
    
    func slider(_ slider: SplitSlider, didUpdate value: CGFloat, for portion: SplitSliderPortion) {
        NSLog("Current value: \(value)")
    }
}
