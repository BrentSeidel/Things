//
// This is a collection of items and boards related to the BeagleBone
// products.
//
use <bbs_pins.scad>

//--------------------------------------------------------------------------------------
// Model and standoffs for the BeagleBone Black
//

module bbs_bbb()
{
    hole_radius = 3.11/2;
    width = 54.50;
    length = 86.47;
    difference()
  { 
        union()
        {
            cube([length, width, 2]);
            translate([-2.50, 4.81, 2]) cube([13.75, 9.02, 11.07]); // 5V adapter
            translate([-2.61, 21.63, 2]) cube([21.06, 16.00, 13.37]); // ethernet interface
            translate([18.16, 1.07, 2]) cube([58.65, 5.01, 8.45]); // connector
            translate([18.16, 49.25, 2]) cube([58.65, 5.01, 8.45]); // connector
            translate([42.25, 7.0, 2.0]) rotate([180, 0, 0]) bbs_header(6);
            translate([0, 40.33, -3.86]) cube([7.19, 7.88, 3.86]); // mini USB connector
            translate([74.03, 10.18, 2]) cube([14.03, 13.15, 6.93]); // USB connector
            translate([79.44, 20.75, -2.53]) cube([7.08, 6.62, 2.53]); // HDMI connector
            translate([71.05, 30.80, -1.56]) cube([14.79, 13.90, 1.56]); // micro SD holder
        }
        translate([0, 0, -1]) bbs_bbb_standoffs(4, hole_radius, 12);
    }
}

module bbs_bbb_standoffs(height, radius, facets)
{
    hole_rad = 3.11/2;
    union()
    {
        translate([13.08 + hole_rad, 1.15 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([79.04 + hole_rad, 4.27 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([13.06 + hole_rad, 49.97 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([79.04 + hole_rad, 46.76 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
    }
}


bbs_bbb();
