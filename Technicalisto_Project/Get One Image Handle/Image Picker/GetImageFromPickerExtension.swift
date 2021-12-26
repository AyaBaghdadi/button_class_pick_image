
///-----------------------------------------------------------------------------------------------
//  Created by Aya Baghdadi.
//  Copyright © 2021 Technicalisto . All rights reserved.
///-----------------------------------------------------------------------------------------------

//MARK:- Using UIImagePickerControllerDelegate

/* This File Has 2 extension for UIButton And UIViewController Using
 UIImagePickerControllerDelegate And UINavigationControllerDelegate
 To Open Delgate of select Image from Camera or Photos
 So , We has extension of UIViewController to function GetFromUIImagePicker for get valuse .....
 if You want to use it you need only
 1.UIButton action & 2.override GetFromUIImagePicker to get data
 
 like This :: Example :
 
 1. Add OpenImageButtonClass to your UIButton
 2.
// // From Observer
  @objc override func GetFromUIImagePicker(_ notification: NSNotification) {
    if let dict = notification.userInfo as NSDictionary? {
    if let pickedImage = dict["pickedImage"] as? UIImage{
    self.viewModel.userImage.value = pickedImage
    }
    if let getImage = dict["getImage"] as? Data{
    self.viewModel.userImageData.value = getImage
    }
    }
}*/

//MARK:- Start

import UIKit

class OpenImageButtonClass : UIButton {
    
    var viewController:UIViewController = UIViewController()

///-----------------------------------------------------------------------------------------------
/// Set Target for Button in awakeFromNib
///-----------------------------------------------------------------------------------------------
    
     override func awakeFromNib() {
        super.awakeFromNib()

        self.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

    }
    
    @objc func buttonTapped(_ sender: Any) {
        self.OpenOneImagePicker()
    }
    
///-----------------------------------------------------------------------------------------------
/// Function to getTopViewController From extension
///-----------------------------------------------------------------------------------------------
    
func getTopViewController() -> UIViewController{
    if let topController = UIApplication.topViewController() {
    return topController
    }
    return UIViewController()
}
    
//MARK:- First Function For Delegate
///-----------------------------------------------------------------------------------------------
/// Open Picker
///-----------------------------------------------------------------------------------------------
    
func OpenOneImagePicker() {
     
viewController = self.getTopViewController()
    
///-----------------------------------------------------------------------------------------------
/// Add Observer
///-----------------------------------------------------------------------------------------------
    
NotificationCenter.default.addObserver(viewController, selector: #selector(viewController.GetFromUIImagePicker(_:)), name: NSNotification.Name(rawValue: "getImageFromDelegate"), object: nil)

///-----------------------------------------------------------------------------------------------
/// Alert Actions
///-----------------------------------------------------------------------------------------------
    
let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
alert.addAction(UIAlertAction(title: NSLocalizedString("Camera", comment: ""), style: .default, handler: { _ in
    self.open(1,self.viewController)
}))

alert.addAction(UIAlertAction(title: NSLocalizedString("Galary", comment: ""), style: .default, handler: { _ in
    self.open(2,self.viewController)
}))
        
alert.addAction(UIAlertAction(title: NSLocalizedString("Galary Saved", comment: ""), style: .default, handler: { _ in
    self.open(3,self.viewController)
}))

alert.addAction(UIAlertAction.init(title: NSLocalizedString("Cancel", comment: ""), style: .destructive, handler: nil))
    
///-----------------------------------------------------------------------------------------------
/// Alert Style Extension
///-----------------------------------------------------------------------------------------------
alert.setBackgroundColor(
    colorBG: UIColor(named: "your_color") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) ,
    color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
)
    
///-----------------------------------------------------------------------------------------------
/// Alert in pad
///-----------------------------------------------------------------------------------------------
    
switch UIDevice.current.userInterfaceIdiom {

case .pad:
    alert.popoverPresentationController?.sourceView = self as UIView
    alert.popoverPresentationController?.sourceRect = (self as AnyObject).bounds
    alert.popoverPresentationController?.permittedArrowDirections = .up

default:

    break
    
}

viewController.present(alert, animated: true, completion: nil)
    
}

//MARK:- Second Function For Delegate
    
///-----------------------------------------------------------------------------------------------
/// Open picker Controller for image
///-----------------------------------------------------------------------------------------------
    
func open(_ select:Int,_ viewController:UIViewController){
    
// 1.Camera , 2.photoLibrary 3.savedPhotosAlbum
    
var pickerController: UIImagePickerController?
pickerController = UIImagePickerController()

if select == 1 {
    if UIImagePickerController.isSourceTypeAvailable(.camera) == false {
        return
    }
    pickerController?.sourceType = .camera
}else if select == 2 {
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == false {
        return
    }
    pickerController?.sourceType = .photoLibrary
}else {
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == false {
        return
    }
    pickerController?.sourceType = .savedPhotosAlbum
}
        
    pickerController?.delegate = self
    pickerController?.allowsEditing = true
        
    viewController.present(pickerController!, animated: true, completion: nil)
        
}

}

