//
// Modules for Arduinos.
//

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

bbs_arduino_mega2560();
