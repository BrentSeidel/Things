use <bbs_pins.scad>
//
// Module for a Raspberry Pi 3.  This will probably also work for the Pi 2.  The large block over the
// processor is the space for a heatsink.
//
length = 85;
width = 56.11;
height = 2;
hole = 1.28;

module rPi3_standoffs(height, radius, facets)
{
    union()
    {
        translate([22.22 + hole, 2.38 + hole, 0]) cylinder($fn=facets, h=height, r=radius);
        translate([80.34 + hole, 2.38 + hole, 0]) cylinder($fn=facets, h=height, r=radius);
        translate([22.22 + hole, 51.15 + hole, 0]) cylinder($fn=facets, h=height, r=radius);
        translate([80.34 + hole, 51.15 + hole, 0]) cylinder($fn=facets, h=height, r=radius);
    }
}
module bbs_rPi3()
{
    difference()
    {
        union()
        {
            cube([length, width, height], center=false);
            translate([-2, 2, height]) cube([17, 13.2, 15.25], center=false); // USB
            translate([-2, 20.52, height]) cube([17, 13.2, 15.25], center=false); // USB
            translate([-2, 38.34, height]) cube([21.32, 16.1, 13.78], center=false); // Ethernet
            translate([28.48, 2, height]) rotate([180, 0, 0]) bbs_header(20); // Connector
            translate([28.48, 4, height]) rotate([180, 0, 0]) bbs_header(20); // Connector
            translate([53.41, 16.56, height]) cube([14.78, 14.89, 16.3], center=false); // Heatsink
            translate([71.68, 12.80, -1.58]) cube([13.18, 12.02, 1.60], center=false); // SD card
            translate([77.03, 17.21, height]) cube([4, 22.35, 5.09], center=false); // Display
            translate([28.83, 44.66, height]) cube([6.82, 14.44, 5.29], center=false); //Audio
        }
        translate([0, 0, -2]) rPi3_standoffs(5, hole, 12);
    }
}

bbs_rPi3();
