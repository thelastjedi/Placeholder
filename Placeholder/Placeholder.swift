//
//  Placeholder.swift
//  Placeholder
//

import Foundation
import UIKit

private struct Backdrop {
    static let prim = UIColor(red:0.95, green:0.90, blue:0.95, alpha:1.00)
    static let polar = UIColor(red:0.90, green:0.95, blue:0.90, alpha:1.00)
    static let finale = UIColor.white
}

extension UIImageView {
    
    func loading() {
        self.backgroundColor = Backdrop.prim
        self.animateBackdrop(color: Backdrop.prim)
    }
    
    private func animateBackdrop(color: UIColor) {
        if (self.backgroundColor === Backdrop.finale) {
            return
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.backgroundColor = color
        }, completion: { (done: Bool) in
            self.animateBackdrop(color: color === Backdrop.polar ? Backdrop.prim : Backdrop.polar)
        })
    }
    
    func finishLoading(image: UIImage) {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.image = image
        }) { (done: Bool) in
            self.finishLoading()
        }
    }
    
    func finishLoading() {
        self.backgroundColor = Backdrop.finale
    }

}
