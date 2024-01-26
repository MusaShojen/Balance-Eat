//
//  WeightPickerView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 19.01.2024.
//

import SwiftUI
import UIKit
import AudioToolbox

struct CustomSlider<Content: View>: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return CustomSlider.Coordinator(parent: self)
    }
    var content : Content
    
    @Binding var offset: CGFloat
    var pickerCount: Int
    
    init(pickerCount: Int,offset: Binding<CGFloat> ,@ViewBuilder content: @escaping () -> Content  ) {
        self.content = content()
        self._offset = offset
        self.pickerCount = pickerCount
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        let swiftUIView = UIHostingController(rootView: content).view!
        let width = CGFloat((pickerCount * 5) * 20) + (getRect().width + 70)
        swiftUIView.backgroundColor = UIColor.clear
        swiftUIView.frame = CGRect(x: 0, y: 0, width: width, height: 100)
   
        scrollView.contentSize = swiftUIView.frame.size
        scrollView.addSubview(swiftUIView)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        scrollView.setContentOffset(CGPoint(x: 200, y: 0 ), animated: false)
        return scrollView
        
    }
    
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: CustomSlider
        
        init(parent: CustomSlider) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
            
        }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            let value = (offset/20).rounded(.toNearestOrAwayFromZero)
            
            scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
            
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            AudioServicesPlayAlertSound(1157)
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if !decelerate {
                let offset = scrollView.contentOffset.x
                let value = (offset/20).rounded(.toNearestOrAwayFromZero)
                
                scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
                
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                AudioServicesPlayAlertSound(1157)
            }
        }
    }
    
    

 }


func getRect () -> CGRect {
    return UIScreen.main.bounds
}
