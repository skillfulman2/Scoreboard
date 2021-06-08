//
//  BLEManager.swift
//  Scoreboard
//
//  Created by Ryan Remaly on 6/1/21.
//

import Foundation
import CoreBluetooth

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    
    var myCentral: CBCentralManager!
    
    @Published var isSwitchedOn = false
    @Published var peripherals = [Peripheral]()
    @Published var connectedDevice: CBPeripheral?
    @Published var data: [String : Any]?
    
    
    override init() {
        super.init()
        
        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
       

    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var peripheralName: String!
        
        
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
        }
        else {
            peripheralName = "Unknown"
        }
        
        if (peripheralName == "UOENO") {
            myCentral.connect(peripheral)
            self.connectedDevice = peripheral
            myCentral.stopScan()
            self.data = advertisementData
            print(self.data?.count)
            
        }
        //print(id ?? "Not set")
        let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
        print(newPeripheral)
        peripherals.append(newPeripheral)
    }
    
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            isSwitchedOn = true
        }
        else {
            isSwitchedOn = false
        }
    }
    
    func connect(peripheral: CBPeripheral) {
        myCentral.connect(peripheral, options: nil)
    }
    
    
    
    func startScanning() {
        print("startScanning")
        myCentral.scanForPeripherals(withServices: nil, options: nil)
    }
    
    
    func stopScanning() {
        print("stopScanning")
        myCentral.stopScan()
    }
    
    
    struct Peripheral: Identifiable {
        let id: Int
        let name: String
        let rssi: Int
    }
    
}

