
///-----------------------------------------------------------------------------------------------
//  Created by Aya Baghdadi.
//  Copyright © 2021 Technicalisto . All rights reserved.
///-----------------------------------------------------------------------------------------------

///----------------------------------------------------------------------------------------------------
/// SetButtonDelegate
///----------------------------------------------------------------------------------------------------

import UIKit

extension UIButton : UIImagePickerControllerDelegate , UINavigationControllerDelegate {

//MARK:- UINavigationControllerDelegate

public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

var getImage : Data = Data()
let pickedImage:UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage

pickedImage.resizeByByte(maxByte: 300000, completion: { (getImages) in
    getImage = getImages
})

// -------
    
let dataDict:[String: Any] = ["pickedImage":pickedImage , "getImage" : getImage]

NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getImageFromDelegate"), object: nil, userInfo: dataDict)

picker.dismiss(animated: true, completion: nil)

}

public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
}

}
