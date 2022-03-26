import UIKit
import Flutter
import CoreBluetooth
import os.log

@available(iOS 13.0, *)
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, CBCentralManagerDelegate {
  private var centralManager: CBCentralManager?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let temperatureChannel = FlutterMethodChannel(name: "samples.flutter.dev/temperature",
                                              binaryMessenger: controller.binaryMessenger)
    temperatureChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      // Handle battery messages.
        temperatureChannel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          // Note: this method is invoked on the UI thread.
          guard call.method == "getTemperatureLevel" else {
            result(FlutterMethodNotImplemented)
            return
          }
          self?.receiveTemperatureLevel(result: result)
        })
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func receiveTemperatureLevel(result: FlutterResult) {
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        result(Int(100))
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
            print("Peripheral: \(peripheral)")
    }
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        var consoleMsg = ""
            
        switch (central.state) {
        case .poweredOff:
            consoleMsg = "BLE is powered off"
        case .poweredOn:
            consoleMsg = "BLE is powered on"
            let options: [String: Any] = [CBCentralManagerScanOptionAllowDuplicatesKey:
                                          NSNumber(value: false)]
            centralManager?.scanForPeripherals(withServices: nil, options: options)
        case .resetting:
            os_log("Connection with the system service was momentarily lost. Update imminent")
        case .unsupported:
            os_log("Platform does not support the Bluetooth Low Energy Central/Client role")
        case .unauthorized:
            switch central.authorization {
            case .restricted:
                os_log("Bluetooth is restricted on this device")
            case .denied:
                os_log("The application is not authorized to use the Bluetooth Low Energy role")
            default:
                os_log("Something went wrong. Cleaning up cbManager")
            }
        default:
            os_log("Cleaning up cbManager")
        }
        
        print("\(consoleMsg)")
    }
    
    
}
