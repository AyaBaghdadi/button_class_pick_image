
///-----------------------------------------------------------------------------------------------
//  Created by Aya Baghdadi.
//  Copyright © 2021 Technicalisto . All rights reserved.
///-----------------------------------------------------------------------------------------------

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // From Observer
    @objc override func GetFromUIImagePicker(_ notification: NSNotification) {
        
        if let dict = notification.userInfo as NSDictionary? {
            
        if let pickedImage = dict["pickedImage"] as? UIImage{
        self.myImageView.image = pickedImage
        }
        if let getImage = dict["getImage"] as? Data{
            // Api
        }
        }
        
    }
    
}


