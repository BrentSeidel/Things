//
// This file contains a number of different items that can mechanically interface with t-slotted aluminum
// extrusions.
//
use <bbs_constants.scad>
use <bbs_connectors.scad>

//
// Aluminum extrusion stand
//
module extrusion_stand()
{
    difference()
    {
        union()
        {
            translate([0, 0, 0]) cube([20, 20, 4]);
            translate([-4, 0, 0]) cube([4, 20, 24]);
            translate([20, 0, 0]) cube([4, 20, 24]);
            translate([-34, 0, -10]) cube([20, 20, 4]);
            translate([34, 0, -10]) cube([20, 20, 4]);
            translate([-14 ,0, -10]) rotate([0, -45, 0]) cube([20, 20, 4]);
            translate([20 ,0, 4]) rotate([0, 45, 0]) cube([20, 20, 4]);
        }
        union()
        {
            translate([10, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            translate([-30, 10, -10.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            translate([50, 10, -10.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            translate([-4.1, 10, 14]) rotate([0, 90, 0]) cylinder(r=screw_m4_size()/2, h=30, $fn=10);
        }
    }
}
//
// The module defines a plate with 20mm x 20mm hole spacing with a 10mm border around the edge.  It
// can be attached to extrusions and used to mount other items.
//
module extrusion_plate(length, width)
{
    size_x = length*20;
    size_y = width*20;
    size_z = 4;
    hole_rad = screw_8_size()/2;
    $nf = 10;
    difference()
    {
        cube([size_x, size_y, size_z]);
        union()
        {
            for(x = [10:20:size_x - 10])
            {
                for(y = [10:20:size_y - 10])
                {
                    translate([x, y, -0.1]) cylinder(r=hole_rad, h=size_z + 0.2);
                }
            }
            //
            // This is added to make it easier to lift a corner for removal from the
            // printer.  It can be eliminated, if not needed.
            //
            translate([5, -0.1, -0.1]) cube([1, 2, 2]);
        }
    }
}
//
// Clips to hold items to a screw plate.
//
module extrusion_clip(height)
{
    union()
    {
        difference()
        {
            cube([20, 20, 4]);
            translate([10, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
        }
        translate([20, 0, 0]) cube([4, 20, height + 4]);
        translate([24, 0, height]) cube([20, 20, 4]);
    }
}
//
// A base for mounting items.
//
module LOCAL_mount()
{
    screw_space = 7;
    difference()
    {
        union()
        {
            translate([0, 10, 0]) cylinder(r=5, h=30, $fn=20);
            translate([-2, 0, 0]) cube([4, 20, 30]);
        }
        union()
        {
            translate([0, 10, 7]) rotate([0, 0, 30]) cylinder(r=3.1, h=30, $fn=6);
            translate([-0.5, -0.1, 7]) cube([1, 20.2, 30]);
            translate([-3, 10 - screw_space, 25])
                rotate([0, 90, 0]) cylinder(r=screw_4_size()/2, h=6, $fn=20);
            translate([-3, 10 + screw_space, 25]) rotate([0, 90, 0])
                cylinder(r=screw_4_size()/2, h=6, $fn=20);
        }
    }
}
//
module extrusion_mount_base()
{
    union()
    {
        difference()
        {
            minkowski()
            {
                translate([3, 3, 0]) cube([54, 14, 3]);
                cylinder(r=3.1, h=1);
            }
            union()
            {
                translate([10, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
                translate([50, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            }
        }
        translate([30, 0, 0]) LOCAL_mount();
    }
}
//
// A base for mounting two items.
//
module extrusion_dual_mount_base()
{
    union()
    {
        difference()
        {
            minkowski()
            {
                translate([3, 3, 0]) cube([54, 14, 3]);
                cylinder(r=3.1, h=1);
            }
            union()
            {
                translate([10, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
                translate([30, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
                translate([50, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            }
        }
        translate([20, 0, 0]) LOCAL_mount();
        translate([40, 0, 0]) LOCAL_mount();
    }
}
//
// Things that can attach to the mounting base.
//
//  Holder for a couple of banana jacks - used to connect to other items.
//
module extrusion_banana()
{
    flange_dia = 35;
    small_r = 3*sqrt(3)/2;
    difference()
    {
        union()
        {
            rotate([0, 0, 30]) cylinder(r=3, h=25, $fn=6);
            translate([-small_r + 1, -flange_dia/2 + 1, 25])
            minkowski()
            {
                cube([small_r*2 - 2, flange_dia, flange_dia/2]);
                sphere(r=1);
            }
        }
        union()
        {
            translate([-2.7, bbs_bannana_connector_spacing()/2, 24.5+flange_dia/4])
                rotate([0, 90, 0]) bbs_bannana_connector_cutout(6);
            translate([-2.7, -bbs_bannana_connector_spacing()/2, 24.5+flange_dia/4])
                rotate([0, 90, 0]) bbs_bannana_connector_cutout(6);
        }
    }
}

//extrusion_clip(10);
//rotate([0, 90, 0]) extrusion_banana();
//translate([0, 20, 0]) extrusion_mount_base();
extrusion_dual_mount_base();
//extrusion_stand();
//extrusion_plate(10, 10);
