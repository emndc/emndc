// Portable Power Bank Design
// Taşınabilir Power Bank Tasarımı
// 
// Specifications:
// - Samsung INR18650 Li-Ion battery (3000 mAh)
// - Turquoise exterior finish
// - 4 LED charge level indicators
// - USB-C/Micro-USB input, USB-A output
// - ABS/PLA compatible housing
// - Keychain attachment
// - BMS safety circuit integration
// - Ventilation holes

// Global parameters
$fn = 50; // Smooth curves

// Battery specifications (Samsung INR18650)
battery_diameter = 18.6; // 18650 battery diameter + tolerance
battery_length = 65.2;   // 18650 battery length + tolerance
battery_wall_thickness = 2; // Wall thickness around battery

// Housing dimensions
housing_length = battery_length + 20; // Extra space for electronics
housing_width = battery_diameter + 2 * battery_wall_thickness + 10; // Extra width for ports
housing_height = battery_diameter + 2 * battery_wall_thickness + 5; // Extra height
corner_radius = 4; // Rounded corners for ergonomics

// Port dimensions
usb_a_width = 12;
usb_a_height = 4.5;
usb_c_width = 9;
usb_c_height = 3.2;
micro_usb_width = 7;
micro_usb_height = 2.5;

// LED dimensions
led_diameter = 3;
led_spacing = 6;

// Keychain ring
keychain_ring_diameter = 8;
keychain_ring_thickness = 2;

// Ventilation holes
vent_hole_diameter = 2;

module rounded_box(length, width, height, radius) {
    hull() {
        translate([radius, radius, 0])
            cylinder(h=height, r=radius);
        translate([length-radius, radius, 0])
            cylinder(h=height, r=radius);
        translate([radius, width-radius, 0])
            cylinder(h=height, r=radius);
        translate([length-radius, width-radius, 0])
            cylinder(h=height, r=radius);
    }
}

module main_housing() {
    difference() {
        // Main housing body
        rounded_box(housing_length, housing_width, housing_height, corner_radius);
        
        // Battery compartment
        translate([10, battery_wall_thickness + 5, battery_wall_thickness])
            rotate([0, 90, 0])
                cylinder(h=battery_length, d=battery_diameter);
        
        // Electronics compartment (BMS area)
        translate([housing_length - 15, battery_wall_thickness, battery_wall_thickness])
            cube([12, housing_width - 2*battery_wall_thickness, housing_height - 2*battery_wall_thickness]);
    }
}

module ports() {
    // USB-A output port
    translate([0, housing_width/2 - usb_a_width/2, housing_height/2 - usb_a_height/2])
        cube([battery_wall_thickness + 1, usb_a_width, usb_a_height]);
    
    // USB-C input port (alternative position)
    translate([housing_length - battery_wall_thickness - 1, housing_width/2 - usb_c_width/2, housing_height/2 - usb_c_height/2])
        cube([battery_wall_thickness + 1, usb_c_width, usb_c_height]);
    
    // Micro-USB input port (alternative to USB-C)
    translate([housing_length - battery_wall_thickness - 1, housing_width/2 - micro_usb_width/2 - 8, housing_height/2 - micro_usb_height/2])
        cube([battery_wall_thickness + 1, micro_usb_width, micro_usb_height]);
}

module led_indicators() {
    // 4 LED indicators for charge level
    for(i = [0:3]) {
        translate([housing_length/2 - 1.5*led_spacing + i*led_spacing, housing_width - 1, housing_height - led_diameter/2 - 1])
            rotate([90, 0, 0])
                cylinder(h=3, d=led_diameter);
    }
}

module keychain_attachment() {
    // Keychain ring attachment point
    translate([housing_length - corner_radius, housing_width/2, housing_height])
        difference() {
            cylinder(h=keychain_ring_thickness, d=keychain_ring_diameter + 4);
            cylinder(h=keychain_ring_thickness + 1, d=keychain_ring_diameter);
        }
}

module ventilation_holes() {
    // Ventilation holes on sides for heat dissipation
    // Left side ventilation
    for(i = [0:2]) {
        for(j = [0:1]) {
            translate([housing_length/4 + i*8, -1, housing_height/3 + j*8])
                rotate([-90, 0, 0])
                    cylinder(h=3, d=vent_hole_diameter);
        }
    }
    
    // Right side ventilation
    for(i = [0:2]) {
        for(j = [0:1]) {
            translate([housing_length/4 + i*8, housing_width - 2, housing_height/3 + j*8])
                rotate([-90, 0, 0])
                    cylinder(h=3, d=vent_hole_diameter);
        }
    }
}

module power_bank() {
    difference() {
        union() {
            main_housing();
            keychain_attachment();
        }
        
        // Subtract ports
        ports();
        
        // Subtract LED holes
        led_indicators();
        
        // Subtract ventilation holes
        ventilation_holes();
    }
}

// Generate the final power bank design
power_bank();

// Add comments for design features
echo("=== Power Bank Design Features ===");
echo("Battery: Samsung INR18650 Li-Ion (3000 mAh)");
echo("Exterior: Turquoise finish (to be applied in post-processing)");
echo("LEDs: 4 indicators for charge levels (0-25%, 26-50%, 51-75%, 76-100%)");
echo("Ports: USB-A output, USB-C and Micro-USB input options");
echo("Material: ABS or PLA compatible");
echo("Safety: BMS compartment included");
echo("Features: Keychain attachment, ventilation holes");
echo(str("Dimensions: ", housing_length, "mm x ", housing_width, "mm x ", housing_height, "mm"));