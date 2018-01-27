//
//  ViewController.swift
//  ContinuationPasingStyle
//
//  Created by spychatter mx on 1/4/18.
//  Copyright © 2018 spychatter. All rights reserved.
//

import UIKit

protocol AsyncronosCountable {
	func count(f: @escaping (Int)-> ())
}


class ViewController: UIViewController {
	
	let statusConnection = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.hasValue(
			onTrue: {
			print("true")
		}) {
			print("false")
			//Do something with errores
		}
	}

	func count(f: @escaping (Bool) -> Void ){
		DispatchQueue.main.async {
			f(self.statusConnection)
		}
	}
	
	func hasValue(onTrue: @escaping()-> (Void), onFalse: @escaping()-> (Void) ){
		count { count in
			
			guard count == true else {
				return onFalse()
			}
			
			onTrue()
		}
	}

	
}

//extension ViewController: AsyncronosCountable{
//	
//}

