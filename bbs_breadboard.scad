//
// This file contains models for breadboards.
//

//--------------------------------------------------------------------------------------
// Half size breadboard
//
module bbs_half_breadboard()
{
    cube([82.46, 54.41, 8.89], center=false);
}

//--------------------------------------------------------------------------------------
// Full size breadboard with screw mounting.  Measurements taken from an Archer brand
// breadboard that I got from Radio Shack (remember them?) years ago.
//
module bbs_full_breadboard()
{
    hole_rad = 2.91/2;
    difference()
    {
        cube([152.14, 53.36, 8.85]);
        translate([0, 0, -0.1]) bbs_full_breadboard_standoffs(9, hole_rad, 12);
    }
}

module bbs_full_breadboard_standoffs(height, radius, facets)
{
    hole_rad = 2.91/2;
    union()
    {
        translate([7.18 + hole_rad, 8.41 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([142.11 + hole_rad, 8.41 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([7.16 + hole_rad, 41.72 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([142.11 + hole_rad, 41.72 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
    }
}

//--------------------------------------------------------------------------------------
// Full size perma-proto board with screw mounting.
//
module bbs_full_permaprotoboard()
{
    hole_rad = 3.2/2;
    difference()
    {
        cube([157.67, 50.88, 2], center=false);
        translate([0, 0, -0.1]) bbs_full_permaprotoboard_standoffs(2.2, hole_rad, 12);
    }
}


module bbs_full_permaprotoboard_standoffs(height, radius, facets)
{
    hole_rad = 3.2/2;
    union()
    {
        translate([2.4 + hole_rad, 23.95 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([77.16 + hole_rad, 23.95 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([152.07 + hole_rad, 23.95 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
    }
}

//--------------------------------------------------------------------------------------
// Half size perma-proto board with screw mounting.
//
module bbs_half_permaprotoboard()
{
    hole_rad = 3.2/2;
    difference()
    {
        cube([81.34, 50.88, 2], center=false);
        translate([0, 0, -0.1]) bbs_half_permaprotoboard_standoffs(2.2, hole_rad, 12);
    }
}


module bbs_half_permaprotoboard_standoffs(height, radius, facets)
{
    hole_rad = 3.2/2;
    union()
    {
        translate([2.3 + hole_rad, 23.95 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([75.91 + hole_rad, 23.95 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
    }
}

//--------------------------------------------------------------------------------------
// Quarter size perma-proto board with screw mounting.
//
module bbs_quarter_permaprotoboard()
{
    hole_rad = 3.2/2;
    difference()
    {
        cube([43.27, 50.88, 2], center=false);
        translate([0, 0, -0.1]) bbs_quarter_permaprotoboard_standoffs(2.2, hole_rad, 12);
    }
}


module bbs_quarter_permaprotoboard_standoffs(height, radius, facets)
{
    hole_rad = 3.2/2;
    union()
    {
        translate([2.3 + hole_rad, 23.95 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
        translate([37.87 + hole_rad, 23.95 + hole_rad, 0]) cylinder(r=radius, h = height, $fn=facets);
    }
}

bbs_quarter_permaprotoboard();
translate([0, 60, 0]) bbs_half_permaprotoboard();
translate([0, 120, 0]) bbs_full_permaprotoboard();
