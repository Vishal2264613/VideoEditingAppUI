//
//  videoPicker.swift
//  XProject
//
//  Created by vishal pawar on 2021-10-27.
//

import SwiftUI

struct videoPicker: UIViewControllerRepresentable{
    
//    @Binding var avatarImage:UIImage
    @Binding var url: URL
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
//        picker.mediaTypes =  ["public.movie"]
//        picker.videoQuality = .typeHigh
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
        
        func makeCoordinator() -> Coordinator{
            return Coordinator(self)
        }
        final class Coordinator: NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
            var VideoPicker: videoPicker
            init(_ VideoPicker: videoPicker){
                self.VideoPicker = VideoPicker
            }
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let video = info[.mediaURL] as? URL{
                    VideoPicker.url = video
                    print(video)
//                    VideoPicker.avatarImage =  UIImage(named: "default-avatar")!
                }else if let image = info[.editedImage] as? UIImage{
                    print(image)
                }
                picker.dismiss(animated: true)
            }
            
        
    }
    

    
    
}
