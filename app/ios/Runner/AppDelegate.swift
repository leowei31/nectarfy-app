import UIKit
import Flutter
import CoreBluetooth
import os.log

@available(iOS 13.0, *)
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, CBCentralManagerDelegate, CBPeripheralDelegate {
  private var centralManager: CBCentralManager?
  private var peripheral: CBPeripheral!
    
  private var finalRes: CBCharacteristic?
    
  private var temperature: String?
  private var humidity: String?
    
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
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
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
    
    private func receiveTemperatureLevel(result: @escaping FlutterResult) {
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) { // Change `2.0` to the desired number of seconds.
            result(self.temperature! + " " + self.humidity!)
        }
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        print("Peripheral name: \(peripheral.name)")
        if(peripheral.name == "SH-HC-08"){
            print("FOUND:::")
            // We've found it so stop scan
            self.centralManager?.stopScan()

            // Copy the peripheral instance
            self.peripheral = peripheral
            self.peripheral.delegate = self

            // Connect!
            self.centralManager?.connect(self.peripheral, options: nil)
            
            print("CONNECTED")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        if peripheral == self.peripheral {
            print("Connected to your bluetooth module")
            peripheral.discoverServices(nil)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print(peripheral.services)
        if let services = peripheral.services {
            for service in services {
                print(service.uuid)
                if service.uuid == CBUUID.init(string: "FFE0") {
                    print("carai viado")
                    peripheral.discoverCharacteristics(nil, for: service)
                }
            }
        }
    }
    
    // Handling discovery of characteristics
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("FINAL FUNCTION")
        print(service)
        print("PRINTING CHARS:::")
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                print(characteristic)
                self.finalRes = characteristic
                self.peripheral.setNotifyValue(true, for: characteristic)
            }
        }
    }
    
    func peripheral(
        _ peripheral: CBPeripheral,
        didUpdateValueFor characteristic: CBCharacteristic,
        error: Error?
    ) {
        
        print("prior to data")
        guard let data = characteristic.value else {
            // no data transmitted, handle if needed
            return
        }
        
        if let data2 = String(data: characteristic.value!, encoding: .utf8) {
            
            let start = data2.index(data2.startIndex, offsetBy: 2)
            let end = data2.index(data2.startIndex, offsetBy: 7)
            let range = start...end
            let temperature = String(data2[range])
            
            let start2 = data2.index(data2.startIndex, offsetBy: 10)
            let humidity = data2.substring(from: start2)
            
            self.temperature = temperature
            self.humidity = humidity
        }
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
