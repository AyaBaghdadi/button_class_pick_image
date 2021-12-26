
# Technicalisto

## How to Create UIButton Class to Pick Data Image

### Purpose
Learn this topics With exact Task

``` 
Add Target
NSNotification Center Send/Get Data
Observer
Override
resize Data By Byte
UIImagePicker Delegate
UIAlert Handle
Top ViewController Get
pickerController

``` 
### How to Use

``` 

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

``` 

### Thanks

This app is inspired by Aya Baghdadi”
and copyright for [@Technicalisto](https://www.youtube.com/channel/UC7554uvArdSxL4tlws7Wf8Q)
