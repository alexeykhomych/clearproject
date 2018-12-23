//
//  ViewController.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/10/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {
    
    let docController = UIDocumentInteractionController()
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
    func documentInteractionControllerViewForPreview(_ controller: UIDocumentInteractionController) -> UIView? {
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.path(forResource: "1", ofType: "pdf") {
            docController.delegate = self
            let url = URL(fileURLWithPath: path)
            docController.url = url
//            docController.uti = url.typeIdentifier ?? "public.data, public.content"
//            docController.name = url.localizedName ?? url.lastPathComponent
            docController.presentPreview(animated: true)
            view.bringSubview(toFront: docController)
        }
    }
}
