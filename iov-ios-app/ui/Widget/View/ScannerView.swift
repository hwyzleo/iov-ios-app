//
//  ScannerView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/3/10.
//

import UIKit
import AVFoundation
import SwiftUI

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            return
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }
}

struct ScannerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = ScannerViewController

    func makeUIViewController(context: Context) -> ScannerViewController {
        return ScannerViewController()
    }

    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        // Update the view controller if necessary.
    }
}

struct ScanView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            ScannerView()
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .padding(40)
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    Spacer()
                }
                .padding(.top, 30)
                Spacer()
                    .frame(height: 530)
                HStack {
                    Spacer()
                    Text("请对准需要识别的二维码")
                        .font(.system(size: 16))
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Button(action: { toggleTorch() }) {
                            Image(systemName: "flashlight.off.fill")
                                .font(.system(size: 20))
                        }
                        .frame(width: 45, height: 45)
                        .background(.gray)
                        .clipShape(Circle())
                        .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                        .buttonStyle(.plain)
                        Spacer()
                            .frame(height: 15)
                        Text("照亮")
                            .font(.system(size: 14))
                    }
                    Spacer()
                        .frame(width: 150)
                    VStack {
                        Button(action: {}) {
                            Image(systemName: "photo.on.rectangle.angled")
                                .font(.system(size: 20))
                        }
                        .frame(width: 45, height: 45)
                        .background(.gray)
                        .clipShape(Circle())
                        .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                        .buttonStyle(.plain)
                        Spacer()
                            .frame(height: 15)
                        Text("相册")
                            .font(.system(size: 14))
                    }
                    Spacer()
                }
                .padding(20)
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

func toggleTorch() {
    guard let device = AVCaptureDevice.default(for: .video) else { return }

    if device.hasTorch {
        do {
            try device.lockForConfiguration()

            if device.torchMode == .on {
                device.torchMode = .off
            } else {
                device.torchMode = .on
            }
            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    } else {
        print("Torch is not available")
    }
}
