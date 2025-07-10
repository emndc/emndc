#!/bin/bash

# Power Bank STL Generator Script
# Taşınabilir Power Bank STL Oluşturucu

echo "=== Power Bank 3D Design Builder ==="
echo "=== Taşınabilir Power Bank 3D Tasarım Oluşturucu ==="
echo

# Check if OpenSCAD is installed
if ! command -v openscad &> /dev/null; then
    echo "❌ Error: OpenSCAD is not installed"
    echo "❌ Hata: OpenSCAD yüklü değil"
    echo "Install with: sudo apt install openscad"
    echo "Yüklemek için: sudo apt install openscad"
    exit 1
fi

echo "✅ OpenSCAD found: $(openscad --version | head -1)"
echo

# Generate STL file
echo "🔧 Generating STL file from OpenSCAD script..."
echo "🔧 OpenSCAD scriptinden STL dosyası oluşturuluyor..."

if openscad -o powerbank_design.stl powerbank_design.scad; then
    echo "✅ STL file generated successfully!"
    echo "✅ STL dosyası başarıyla oluşturuldu!"
    
    # Show file info
    if [ -f "powerbank_design.stl" ]; then
        file_size=$(ls -lh powerbank_design.stl | awk '{print $5}')
        echo "📁 File size / Dosya boyutu: $file_size"
        echo "📍 Location / Konum: $(pwd)/powerbank_design.stl"
    fi
    
    echo
    echo "🎯 Design features / Tasarım özellikleri:"
    echo "   • Samsung INR18650 battery compartment"
    echo "   • 4 LED charge indicators"
    echo "   • USB-A output & USB-C/Micro-USB input"
    echo "   • Keychain attachment"
    echo "   • Ventilation holes"
    echo "   • BMS safety circuit compartment"
    echo
    echo "📋 Next steps / Sonraki adımlar:"
    echo "   1. Import STL into your 3D slicer"
    echo "   2. Use recommended print settings (see POWERBANK_DESIGN.md)"
    echo "   3. Print with PLA or ABS material"
    echo "   4. Post-process with turquoise paint/coating"
    echo "   5. Assemble with electronic components"
    
else
    echo "❌ Error generating STL file"
    echo "❌ STL dosyası oluşturulurken hata"
    exit 1
fi