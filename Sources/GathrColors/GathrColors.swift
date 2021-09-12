import SwiftUI

struct GathrColors {
    var text = "Hello, World!"
}

public extension Color {
    static let gathrprimary = Color(hex:"#15717d")
    static let gathrsecondary = Color(hex:"#544f40")
    static let gathraccent = Color(hex:"#f36633")
    static let gathrerror = Color(hex:"#E40030")
    static let gathrsuccess = Color(hex:"#008748")
    static let gathrsurface = Color(hex:"#efefed")
    static let gathrsurfaceLight = Color(hex:"#fafaf8")
    static let gathrsurfaceDark = Color(hex:"#bebebd")
    static let white = Color.white
    static let gathrwarning = Color(hex:"#ffb800")
    static let gathrsecondaryLow = Color(hex:"#544f40", alpha:0.4)
    static let gathrwhiteLow = Color(hex:"#ffffff", alpha:0.4)
    static let gathrprimaryHigh = Color(hex:"#178595", alpha:0.4)
    static let gathrtertiary01 = Color(hex:"#40488d")
    static let gathrtertiary02 = Color(hex:"#e49b13")
    static let gathrtertiary03 = Color(hex:"#bc1077")
    static let gathrtertiary04 = Color(hex:"#008a00")
}

extension Color {
    init(hex string: String, alpha: Double = 1.0) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            //let a = Int(color) & mask

            let gray = Double(g) / 255.0
            //let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            //let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            //let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
