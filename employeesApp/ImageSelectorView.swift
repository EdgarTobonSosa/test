//
//  ImageSelectorView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI


import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    @Binding var imageSelected: UIImage
    @State var photoPickerItem: PhotosPickerItem?

    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                PhotosPicker(selection: $photoPickerItem, matching: .images) {
                    
                    Image(systemName: "gear")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 42)
                        .cornerRadius(10)
                    
                    Text("Setting")
                        .bold()
                    
                }
            }
        }
        .onChange(of: photoPickerItem) { _ in
            Task {
                if let photoPickerItem, let data  = try? await photoPickerItem.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        imageSelected = image
                    }
                }
            }
        }
    }
}

#Preview {
    PhotosPickerView(imageSelected: Binding.constant(UIImage(systemName: "gear")!))
}

