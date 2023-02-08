//
//  Device.swift
//  Rockets
//
//  Created by Nicky Taylor on 1/23/23.
//

import UIKit

struct Device {
    static var isIpad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
