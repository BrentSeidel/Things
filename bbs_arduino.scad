//
// Modules for Arduinos.
//
use <bbs_pins.scad>
use <bbs_tray.scad>

//--------------------------------------------------------------------------------------
// This is a model for the basic Arduino Uno.  The standoff model will probably work
// for any of the other small Arduino boards.
//
module bbs_arduino_uno()
{
    hole_rad = 3.06/2;
    difference()
    {
        union()
        {
            cube([68.84, 53.35, 2]);
            translate([-1.82, 4.09, 2]) cube([14.10, 9.60, 10.82]); // power connector
            translate([-6.22, 32.30, 2]) cube([16.40, 12.06, 11.00]); // USB connector
            translate([26.21, 1.97, 2]) cube([38.72, 2.50, 8.63]); // connector
            translate([17.56, 42.07, 2]) cube([47.88, 2.47, 8.51]); // connector
        }
        bbs_arduino_uno_standoffs(2.2, hole_rad, 20);
    }
}
//
// Standoffs for Arduino Uno.  This should also work for other small board Arduinos.
//
module bbs_arduino_uno_standoffs(height, radius, facets)
{
    hole_rad = 3.06/2;
    union()
    {
        translate([12.80 + hole_rad, 1.31 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([64.64 + hole_rad, 6.50 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([14.07 + hole_rad, 49.27 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([64.59 + hole_rad, 34.21 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
    }
}


//--------------------------------------------------------------------------------------
module bbs_arduino_mega2560()
{
    hole_rad = 3.15/2;
    difference()
    {
        union()
        {
            cube([99.22, 53.5, 1.8]);
            cube([101.64, 40.41, 1.8]);
            translate([-2.36, 4.40, 1.8]) cube([13.84, 9, 10.95]); // power connector
            translate([-6.22, 32.41, 1.8]) cube([16.28, 12, 10.76]); // USB connector
            translate([31.66, 1.69, 1.8]) cube([61.3, 2.51, 8.48]); // connectors
            translate([93.15, 6.25, 1.8]) cube([5, 46.04, 9.67]); // connectors
            translate([22.44, 46.67, 1.8]) cube([64.34, 2.46, 8.47]); // connectors
        }
        translate([0, 0, -0.1]) bbs_arduino_mega2560_standoffs(2, hole_rad, 20);
    }
}
//
// The standoff pattern also works for the Arduino Due and will probably work for the Mega
// as well.
//
module bbs_arduino_mega2560_standoffs(height, radius, facets)
{
    hole_rad = 3.15/2;
    union()
    {
        translate([12.74 + hole_rad, 0.84 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([95.19 + hole_rad, 0.84 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([14 + hole_rad, 49.64 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([88.84 + hole_rad, 49.64 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([64.75 + hole_rad, 6.47 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([64.75 + hole_rad, 34.30 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
    }
}
//--------------------------------------------------------------------------------------
// Trays
//
module bbs_arduino_uno_tray()
{
    difference()
    {
        union()
        {
            bbs_tray(4, 4, false);
            translate([0, 15,.0]) bbs_arduino_uno_standoffs(7, 5, 20);
        }
        union()
        {
            translate([0, 15, -0.01]) bbs_arduino_uno_standoffs(10, 2, 20);
        }
    }
}
//
module bbs_arduino_mega_tray()
{
    difference()
    {
        union()
        {
            bbs_tray(4, 5, false);
            translate([10, 15,.0]) bbs_arduino_mega2560_standoffs(7, 3, 20);
        }
        union()
        {
            translate([10, 15, -0.01]) bbs_arduino_mega2560_standoffs(10, 2, 20);
            translate([-5, 10, -0.1]) minkowski()
            {
                cube([23, 70, 3]);
                cylinder(r = 2, h = 1, $fn=12);
            }
            translate([33, 10, -0.1]) minkowski()
            {
                cube([35, 70, 3]);
                cylinder(r = 2, h = 1, $fn=12);
            }
            translate([83, 10, -0.1]) minkowski()
            {
                cube([10, 70, 3]);
                cylinder(r = 2, h = 1, $fn=12);
            }
        }
    }
}
//bbs_arduino_uno();
translate([0, -15, -10]) bbs_arduino_mega_tray();

//translate([10, 0, 0]) bbs_arduino_mega2560();
