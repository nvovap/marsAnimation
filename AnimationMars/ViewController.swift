//
//  ViewController.swift
//  AnimationMars
//
//  Created by nvovap on 10/27/16.
//  Copyright © 2016 nvovap. All rights reserved.
//https://youtu.be/WNt2xfSvChc?t=9m55s

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iuMars: UIImageView!
    
    @IBOutlet weak var myButton: UIButton!
    
   
    var animator: UIViewPropertyAnimator!


    @IBOutlet weak var marsView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let parameters = UICubicTimingParameters(animationCurve: .easeIn)
        animator = UIViewPropertyAnimator(duration: 5.0, timingParameters: parameters)
        
        
        animator.addCompletion { (position) in
            print(position.rawValue)
            
            
            
            //self.startAnimation.setTitle("Start animation", for: UIControlState.normal)
        }
        
        
       
        
        
        
        
        
        
        let mars = UIImage(named: "MARS")!
        let r = UIGraphicsImageRenderer(size: mars.size)
        let empty = r.image { (context) in}
        
        
        let arr = [mars, empty, mars, empty, mars]
        
        iuMars.image = empty
        
        iuMars.animationImages = arr
        
        iuMars.animationDuration = 2
        iuMars.animationRepeatCount = 1
        
        
        iuMars.startAnimating()
        
        
        var arrForButton = [UIImage]()
        let w: CGFloat = 40
        
        for i in 0 ..< 6 {
            let r = UIGraphicsImageRenderer(size: CGSize(width: w, height: w))
            arrForButton += [r.image(actions: { (ctx) in
                let con = ctx.cgContext
                con.setFillColor(UIColor.red.cgColor)
                
                let ii = CGFloat(i)
                con.addEllipse(in:CGRect(x: 0+ii, y: 0+ii, width: w-ii*2, height: w-ii*2))
                con.fillPath()
            
            }) ]
        }
        
        let image = UIImage.animatedImage(with: arrForButton, duration: 0.5)
        
        myButton.setImage(image, for: .normal)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapClick))
   //     tap.delegate = self
        
        iuMars.addGestureRecognizer(tap)
        
        
        
    }
    
    @IBAction func stopPress() {
        animator.stopAnimation(false)
    }
    
    @IBAction func stepRightPress() {
        print(animator.fractionComplete)
        
        animator.fractionComplete -= 0.1
    }
    
    
    @IBAction func stepLeftPress() {
        print(animator.fractionComplete)
        animator.fractionComplete += 0.1
    }
    
    @IBAction func reversPress() {
        
        animator.isReversed = true
        
    }
    
    //http://security-corp.org/programming/vebdev/33973-ios-10-novoe-v-sozdanii-animaciy.html
    @IBAction func startPress() {
        
        if animator.isRunning {
            
            animator.pauseAnimation()
            
            //animator.isReversed = true
            
           // startAnimation.setTitle("Continгу animation", for: UIControlState.normal)
            
        } else if animator.isInterruptible {
            
          //  animator.continueAnimation(withTimingParameters: UITimingCurveProvider, durationFactor: <#T##CGFloat#>)
            
            animator.addAnimations {
                self.marsView.center = CGPoint(x: 160, y: 444)
                self.marsView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
            }
            
            animator.startAnimation()
           
            
        } else {
        
            
            
           // startAnimation.setTitle("Pause animation", for: UIControlState.normal)
            
        }
        
    }
    
    
    @IBAction func ios10() {
        
        let anim = UIViewPropertyAnimator(duration: 1, curve: .linear){
            self.view.backgroundColor = UIColor.blue
        }
        
        anim.startAnimation()
        
    }
    
    
    
    func tapClick() {
        UIView.animate(withDuration: 1){
            self.view.backgroundColor = UIColor.green
        }
    }
    
    
    @IBAction func oldAnimation(_ sender: UIButton) {
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        if self.view.backgroundColor == UIColor.red {
            self.view.backgroundColor = UIColor.white
        } else {
            self.view.backgroundColor = UIColor.red
        }

        
        UIView.commitAnimations()
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

