
///-----------------------------------------------------------------------------------------------
//  Created by Aya Baghdadi.
//  Copyright © 2021 Technicalisto . All rights reserved.
///-----------------------------------------------------------------------------------------------

///----------------------------------------------------------------------------------------------------
/// AlertHandle 
///----------------------------------------------------------------------------------------------------

import UIKit

extension UIAlertController {

    //Set background color of UIAlertController
    func setBackgroundColor(colorBG: UIColor , color: UIColor ) {
        if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first {
            contentView.backgroundColor = colorBG
            bgView.tintColor = color 
        }
    }

}
