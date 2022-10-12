//
//  BreatheImageView.swift
//  venom
//
//  Created by BLOM on 10/6/22.
//  Copyright © 2022 Venom. All rights reserved.
//

import Foundation

public class BreatheImageView: UIImageView {
    public func startBreathAnimation() {
        UIView.animate(withDuration: 0.8, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
        }, completion: nil)
    }
    
    public func stopBreatheAnimation() {
        self.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        self.layer.removeAllAnimations()
    }
}
