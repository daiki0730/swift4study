//
//  ViewController.swift
//  CameraApp
//
//  Created by Nishida Daiki on 2020/08/16.
//  Copyright © 2020 Nishida Daiki. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var photoImage: UIImageView!
   
    //カメラが起動してるか、ユーザーがカメラの仕様を許可してるか確認
    @IBAction func cameraLaunchAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("camera can be used.")
            //カメラからデータを取得する
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            //イメージピッカーを表示
            present(ipc, animated:true, completion: nil)
        }else{
            print("camera isn't available.")
        }
    }
    
    //SNSでシェアする
    @IBAction func shareAction(_ sender: Any) {
        if let sharedImage = photoImage.image {
            //シェアする画像を格納
            let sharedItems = [sharedImage]
            //シェアを行うアクティビティを保存
            let controller = UIActivityViewController(activityItems: sharedItems, applicationActivities: nil)
            //iPad用
            controller.popoverPresentationController?.sourceView = view
            //コントローラを表示
            present(controller, animated: true, completion: nil)
        }
    }
    
    
    //取得した画像を処理する
    //String?
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }

}

