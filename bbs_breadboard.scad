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


bbs_full_breadboard();
