//
// This file contains a number of different items that can mechanically interface with t-slotted aluminum
// extrusions.
//
use <bbs_boards.scad>
use <bbs_breadboard.scad>
use <bbs_constants.scad>
use <bbs_connectors.scad>

//
// Type 1 stand for Aluminum extrusion
//
module extrusion_stand_1(sides = true)
{
    difference()
    {
        union()
        {
            translate([-4, 0, 0]) cube([28, 20, 4]);
            if (sides)
            {
                translate([-4, 0, 0]) cube([4, 20, 24]);
                translate([20, 0, 0]) cube([4, 20, 24]);
            }
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
            if (sides)
            {
                translate([-4.1, 10, 14]) rotate([0, 90, 0]) cylinder(r=screw_m4_size()/2, h=30, $fn=10);
            }
        }
    }
}
//
// Type 2 stand
//
module extrusion_stand_2(sides = true, frames = 1)
{
    union()
    {
        for(y = [0:1:frames - 1])
        {
            translate([0, y*20, 0]) difference()
            {
                union()
                {
                    translate([0, 0, 0]) cube([20, 20, 4]);
                    translate([-20, 0, -20]) cube([20, 20, 4]);
                    translate([20, 0, -20]) cube([20, 20, 4]);
                    if (sides)
                    {
                        translate([-4, 0, -20]) cube([4, 20, 24]);
                        translate([20, 0, -20]) cube([4, 20, 24]);
                        translate([-4, 0, 0]) cube([4, 20, 24]);
                        translate([20, 0, 0]) cube([4, 20, 24]);
                    }
                    else
                    {
                        translate([0, 0, -20]) cube([4, 20, 24]);
                        translate([16, 0, -20]) cube([4, 20, 24]);
                    }
                }
                union()
                {
                    translate([10, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
                    translate([-10, 10, -20.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
                    translate([10, 10, -20.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
                    translate([30, 10, -20.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
                    if (sides)
                    {
                        translate([-4.1, 10, 14]) rotate([0, 90, 0])
                            cylinder(r=screw_m4_size()/2, h=30, $fn=10);
                    }
                }
            }
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
// A piece that fits in the mount.  This is used for making things that will fit in the mount.
//
module extrusion_mount_fitting(len)
{
    translate([0, 0, -len]) rotate([0, 0, 30]) cylinder(r=3, h=len, $fn=6);
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
// Mount for holding a particular lens that I have.  Modify for your needs.  It has been
// generalized and parameterized to work for other items that can be held
//
module extrusion_mount_lens(thickness, heigh, lift)
{
    tfinger = 6; // Thickness of finger
    wfinger = 5; // width of finger
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
        translate([30, 0, 0]) difference()
        {
            union()
            {
                translate([-(thickness+tfinger)/2, 0, 0]) cube([thickness+tfinger, wfinger, heigh]);
                translate([-(thickness+tfinger)/2, 20-wfinger, 0]) cube([thickness+tfinger, wfinger, 30]);
            }
            union()
            {
                translate([-thickness/2, -0.1, lift]) cube([thickness, 20.2, 30]);
            }
        }
    }
}
//
// Things that can attach to the mounting base.
//
//  Holder for a couple of banana jacks - used to connect to other items.
//
module extrusion_banana(len)
{
    flange_dia = 35;
    small_r = 3*sqrt(3)/2;
    difference()
    {
        union()
        {
            extrusion_mount_fitting(len);
            translate([-small_r + 1, -flange_dia/2 + 1, 0])
            minkowski()
            {
                cube([small_r*2 - 2, flange_dia, flange_dia/2]);
                sphere(r=1);
            }
        }
        union()
        {
            translate([-2.7, bbs_bannana_connector_spacing()/2, flange_dia/4-0.5])
                rotate([0, 90, 0]) bbs_bannana_connector_cutout(6);
            translate([-2.7, -bbs_bannana_connector_spacing()/2, flange_dia/4-0.5])
                rotate([0, 90, 0]) bbs_bannana_connector_cutout(6);
        }
    }
}
//
//  Holder for some circuitry.
//
module extrusion_circuit(len)
{
    flange_dia = 35;
    small_r = 3*sqrt(3)/2;
    difference()
    {
        union()
        {
            extrusion_mount_fitting(len);
            translate([-small_r + 1, -flange_dia/2 + 1, 0])
            minkowski()
            {
                cube([small_r*2 - 2, flange_dia, flange_dia]);
                sphere(r=1);
            }
            translate([-small_r, -5, flange_dia]) cube([small_r*2, 10, 85]);
            translate([0, -23.95-3.2/2, flange_dia]) rotate([0, -90, 0])
                bbs_half_permaprotoboard_standoffs(6, 8/2, 10);
        }
        union()
        {
            translate([-2.7, bbs_bannana_connector_spacing()/2, flange_dia/4-0.5])
                rotate([0, 90, 0]) bbs_bannana_connector_cutout(6);
            translate([-2.7, -bbs_bannana_connector_spacing()/2, flange_dia/4-0.5])
                rotate([0, 90, 0]) bbs_bannana_connector_cutout(6);
            translate([-2.7, bbs_bannana_connector_spacing()/2, 3*flange_dia/4-0.5])
                rotate([0, 90, 0]) bbs_bannana_connector_cutout(6);
            translate([-2.7, -bbs_bannana_connector_spacing()/2, 3*flange_dia/4-0.5])
                rotate([0, 90, 0]) bbs_bannana_connector_cutout(6);
            translate([-2.7, 0, flange_dia]) bbs_half_permaprotoboard_standoffs(6, screw_6_size(), 10);
            translate([2.7, -23.95-3.2/2, flange_dia]) rotate([0, -90, 0])
                bbs_half_permaprotoboard_standoffs(10, screw_6_size()/2, 10);
        }
    }
}
//
//  Holder for ping sonar module from Parallax Inc.
//
module extrusion_ping_sonar(len)
{
    flange_dia = 48.53;
    small_r = 3*sqrt(3)/2;
    difference()
    {
        union()
        {
            extrusion_mount_fitting(len);
            translate([-small_r + 1, -flange_dia/2 + 1, 0])
            minkowski()
            {
                cube([small_r*2 - 2, flange_dia, 25]);
                sphere(r=1);
            }
            translate([0, 46.53/2, 2.24]) rotate([90, 0, 0]) rotate([0, -90, 0])
                bbs_ping_sonar_standoffs(6, 8/2, 12);
        }
        union()
        {
            translate([2.7, 46.53/2, 2.24]) rotate([90, 0, 0]) rotate([0, -90, 0])
                bbs_ping_sonar_standoffs(10, screw_6_size()/2, 12);
        }
    }
}
//
// Examples
//
//extrusion_clip(10);
//extrusion_mount_base();
//extrusion_dual_mount_base();
//extrusion_mount_lens(6.03, 30, 8);
//extrusion_mount_lens(9.8, 30, 8);
//extrusion_stand_2(false, 1);
//extrusion_plate(10, 10);

//rotate([0, 90, 0]) extrusion_circuit(25);
//rotate([0, 90, 0]) extrusion_banana(0);
rotate([0, 90, 0]) extrusion_ping_sonar(25);
