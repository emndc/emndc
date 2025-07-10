# Taşınabilir Power Bank Tasarımı / Portable Power Bank Design

Bu proje, cebe sığacak ve anahtarlık boyutunda taşınabilir bir power bank için 3D tasarım dosyalarını içerir.

This project contains 3D design files for a portable, pocket-sized, keychain power bank.

## Tasarım Özellikleri / Design Features

### 🔋 Batarya / Battery
- **Model**: Samsung INR18650 Li-Ion pil
- **Kapasite**: 3000 mAh
- **Boyutlar**: 18.6mm çap × 65.2mm uzunluk

### 🎨 Görünüm / Appearance
- **Renk**: Turkuaz dış kaplama (post-processing ile uygulanacak)
- **Malzeme**: ABS veya PLA plastik
- **Boyutlar**: 85.2mm × 32.6mm × 27.6mm
- **Ağırlık**: ~150g (batarya dahil)

### 💡 LED Gösterge Sistemi / LED Indicator System
4 adet LED ışık şarj seviyesini gösterir:
- **%0-25**: 1 LED yanar (kırmızı)
- **%26-50**: 2 LED yanar (turuncu)
- **%51-75**: 3 LED yanar (sarı)
- **%76-100**: 4 LED yanar (yeşil)

### 🔌 Bağlantı Noktaları / Connection Ports
- **Giriş**: USB-C veya Micro-USB (alternatif konumlar)
- **Çıkış**: USB-A portu
- **Hız**: 5V/2A giriş, 5V/2.1A çıkış

### 🛡️ Güvenlik / Safety Features
- **BMS**: Aşırı akım ve kısa devre koruma devresi
- **Termal Koruma**: Havalandırma delikleri
- **Kalite**: CE/FCC sertifikası uyumlu tasarım

### 🔗 Ekstra Özellikler / Extra Features
- **Anahtarlık**: 8mm çapında halka
- **Havalandırma**: Isı dağıtımı için delikler
- **Ergonomi**: Yuvarlatılmış köşeler
- **Dayanıklılık**: Düşme testlerine uygun tasarım

## Dosyalar / Files

- `powerbank_design.scad` - OpenSCAD kaynak dosyası
- `powerbank_design.stl` - 3D yazdırma dosyası
- `build.sh` - STL oluşturma scripti

## Kullanım / Usage

### STL Dosyası Oluşturma / Generate STL File

```bash
# OpenSCAD ile STL oluştur
openscad -o powerbank_design.stl powerbank_design.scad

# Veya build script kullan
./build.sh
```

### 3D Yazdırma Ayarları / 3D Printing Settings

```
Katman Yüksekliği / Layer Height: 0.2mm
Doluluk / Infill: 20-30%
Destek / Support: Evet (USB portları için)
Yazdırma Hızı / Print Speed: 50mm/s
Nozzle Sıcaklığı / Nozzle Temp: 200°C (PLA), 250°C (ABS)
Tabla Sıcaklığı / Bed Temp: 60°C (PLA), 100°C (ABS)
```

## Montaj Kılavuzu / Assembly Guide

### Gerekli Parçalar / Required Components

1. **Ana Gövde**: 3D yazdırılmış housing
2. **Batarya**: Samsung INR18650
3. **BMS Kartı**: 1S 3.7V koruma devresi
4. **LED'ler**: 4x 3mm LED (kırmızı, turuncu, sarı, yeşil)
5. **Portlar**: USB-A, USB-C/Micro-USB konektörleri
6. **Kablolar**: AWG 22 tel
7. **Vida/Civata**: M2×6mm (4 adet)

### Montaj Adımları / Assembly Steps

1. **BMS kartını** elektronik bölmesine yerleştirin
2. **Bataryayı** pil yuvasına takın
3. **LED'leri** üst paneldeki deliklere yerleştirin
4. **USB portlarını** yan panellere monte edin
5. **Kabloları** BMS kartına bağlayın
6. **Test edin** ve kapağı kapatın

## Lisans / License

Bu tasarım açık kaynak olarak sunulmuştur. Ticari olmayan kullanım için özgürdür.

This design is provided as open source. Free for non-commercial use.

## Uyarılar / Warnings

⚠️ **Güvenlik Uyarıları / Safety Warnings**:
- Li-Ion bataryalar tehlikeli olabilir
- BMS devresi mutlaka kullanın
- Kısa devre yapmayın
- Aşırı ısınmaya dikkat edin
- Çocukların erişemeyeceği yerde saklayın

⚠️ **Safety Warnings**:
- Li-Ion batteries can be dangerous
- Always use BMS circuit
- Avoid short circuits
- Watch for overheating
- Keep away from children