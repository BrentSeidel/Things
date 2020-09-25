use <bbs_pins.scad>
use <bbs_t_extrusion.scad>
//
// Module for a Raspberry Pi 3.  This will probably also work for the Pi 2.  The large block over the
// processor is the space for a heatsink.
//
length = 85;
width = 56.11;
height = 2;
hole = 1.28;
x1 = 22.22 + hole;
x2 = 80.34 + hole;
y1 = 2.38 + hole;
y2 = 51.15 + hole;

module rPi3_standoffs(height, radius, facets)
{
    union()
    {
        translate([x1, y1, 0]) cylinder($fn=facets, h=height, r=radius);
        translate([x2, y1, 0]) cylinder($fn=facets, h=height, r=radius);
        translate([x1, y2, 0]) cylinder($fn=facets, h=height, r=radius);
        translate([x2, y2, 0]) cylinder($fn=facets, h=height, r=radius);
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
//
// A mount for a Raspberry Pi 3 that attaches to a t extrusion (20x20 size)
//
module bbs_rPi3_mount()
{
    curve = 5;
    height = 25;
    difference()
    {
        union()
        {
            rPi3_standoffs(5, 2.8, 12);
            rPi3_standoffs(2, 5, 12);
            translate([x1, y1, 0]) minkowski()
            {
                cube([x2 - x1, y2 - y1, 1]);
                cylinder(r = curve, h = 1, $fn=12);
            }
//            translate([38, -23, 0]) cube([24, 23, height]);
            translate([x1, y1-1, 0]) cube([x2-x1, 2, 3]);
            translate([x1, y2-1, 0]) cube([x2-x1, 2, 4]);
            translate([x1-1, y1, 0]) cube([2, y2-y1, 4]);
            translate([x2-1, y1, 0]) cube([2, y2-y1, 4]);
            translate([38, -1, 0]) cube([24, y1, 4]);
        }
        union()
        {
            translate([0, 0, -0.1]) rPi3_standoffs(5 + 6, 1.5, 12);
            translate([x1 + curve + 2, y1 + curve + 2, -0.1]) minkowski()
            {
                cube([x2 - x1 - 2*curve - 4, y2 - y1 - 2*curve - 4, 2]);
                cylinder(r = curve, h = 1, $fn=12);
            }
//            translate([40, -24, -0.1]) cube([20, 21, height + 1]);
        }
    }
    translate([38, 0, 0]) extrusion_snap_clip(25);
}

//translate([0, 0, 6]) color("red") bbs_rPi3();
bbs_rPi3_mount();

