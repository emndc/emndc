- 👋 Hi, I'm @emndc
- 👀 I'm interested in machine learning and crypto
- 🌱 I'm currently learning Python
- 📫 How to reach me emndc@hotmail.com

## 🔋 Latest Project: Portable Power Bank Design

I've created a 3D design for a portable, keychain-sized power bank with the following features:

- **Battery**: Samsung INR18650 Li-Ion (3000 mAh)
- **Design**: Turquoise exterior, compact form factor (85.2×32.6×27.6mm)
- **Indicators**: 4 LED charge level display
- **Ports**: USB-A output, USB-C/Micro-USB input
- **Safety**: BMS protection circuit integration
- **Extras**: Keychain attachment, ventilation holes

### Files:
- `powerbank_design.scad` - OpenSCAD source file
- `powerbank_design.stl` - 3D printable STL file
- `POWERBANK_DESIGN.md` - Detailed documentation
- `build.sh` - Build script for STL generation

### Quick Start:
```bash
# Generate STL file
./build.sh

# Or manually with OpenSCAD
openscad -o powerbank_design.stl powerbank_design.scad
```

<!---
emndc/emndc is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->