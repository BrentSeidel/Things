//
// This file contains a set of models for working with small servo motors.
//
use <bbs_constants.scad>
//--------------------------------
//  SG-5010 dimensions from TowerPro website, http://www.towerpro.com.tw/product/sg5010-4/
// All dimensions are in mm.
//
sg5010_a = 44.1; // Full height, top (including actuator) to bottom (unused in modeling)
sg5010_b = 40.7; // Length of body
sg5010_c = 38.0; // Another height top to bottom of body
sg5010_d = 20.0; // Width
sg5010_e = 55.0; // Full length including mounting flanges
sg5010_f = 27.8; // Height from bottom to bottom of mounting flanges
//
// Measured dimensions
//
sg5010_mount_rad=4.0/2;
//
// Model for a SG-5010 servo
//
module bbs_sg5010()
{
    mount_rad=3.46/2;
    difference()
    {
        union()
        {
            cube([sg5010_b, sg5010_d, sg5010_c]);
            translate([-6.69, 7.08, 2.4]) cube([6.7, 7.72, 4.5]);
            translate([-7.5, 0, sg5010_f]) cube([sg5010_e, sg5010_d, 2.54]);
            translate([6.92+5.68/2, sg5010_d/2, sg5010_c]) cylinder(r=5.68/2,h=4.88);
        }
        union()
        {
            translate([-(3.10+mount_rad), 2.95+mount_rad, 20]) cylinder(r=sg5010_mount_rad,h=40);
            translate([-(3.10+mount_rad), 12.81+mount_rad, 20]) cylinder(r=sg5010_mount_rad,h=40);
            translate([42.83+mount_rad, 2.95+mount_rad, 20]) cylinder(r=sg5010_mount_rad,h=40);
            translate([42.83+mount_rad, 12.81+mount_rad, 20]) cylinder(r=sg5010_mount_rad,h=40);
        }
    }
}
//
// Clips for SG-5010 servo.  One is a full clip and the other two are half clips.
//
module bbs_sg5010_clip_l()
{
    difference()
    {
        union()
        {
            cube([20, 20, 4]);
            translate([20, 0, 0]) cube([3, 20, 20 + 4]);
            translate([23, 0, sg5010_d]) cube([16, 20, 4]);
            translate([15, 18, 4]) cube([7, 2, 20]);
        }
        union()
        {
            translate([10, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            translate([20-mount_rad, 15, 3+sg5010_mount_rad]) rotate([-90, 0, 0])
                cylinder(r=sg5010_mount_rad,h=10);
            translate([20-mount_rad, 15, 12.81+sg5010_mount_rad]) rotate([-90, 0, 0])
                cylinder(r=sg5010_mount_rad,h=10);
        }
    }
}
//
module bbs_sg5010_clip_r()
{
    scale([-1,1,1]) bbs_sg5010_clip_l();
}
//
// Using this clip, I noticed that the servo got quite warm after some use.  I'm not sure if this
// is part of the nature of the servos or of the clip is insulating the servo.  The other side of
// the servo was pressed against an aluminum extrusion which should provide some heat sinking.
//
module bbs_sg5010_clip()
{
    difference()
    {
        union()
        {
            cube([22, 20, 4]);
            translate([21, 0, 0]) cube([2, 20, sg5010_d + 4]);
            translate([23, 0, sg5010_d]) cube([42, 20, 4]);
            translate([16, 18, 4]) cube([7, 2, sg5010_d]);
//
            translate([64, 0, 0]) cube([2, 20, 20 + 4]);
            translate([64, 0, 0]) cube([20, 20, 4]);
            translate([66, 18, 4]) cube([6, 2, 20]);
        }
        union()
        {
            translate([7, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            translate([20-sg5010_mount_rad, 15, 3+sg5010_mount_rad]) rotate([-90, 0, 0])
                cylinder(r=screw_8_size()/2,h=10);
            translate([20-sg5010_mount_rad, 15, 12.81+sg5010_mount_rad]) rotate([-90, 0, 0])
                cylinder(r=screw_8_size()/2,h=10);
//
            translate([77, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            translate([66.83+sg5010_mount_rad, 15, 3+sg5010_mount_rad]) rotate([-90, 0, 0])
                cylinder(r=screw_8_size()/2,h=10);
            translate([66.83+sg5010_mount_rad, 15, 12.81+sg5010_mount_rad]) rotate([-90, 0, 0])
                cylinder(r=screw_8_size()/2,h=10);
        }
    }
}
//
module bbs_sg5010_bracket()
{
    offset_x = (60-sg5010_b)/2;
    difference()
    {
        union()
        {
            cube([60, 20, 4]);
            translate([0, 20, 0]) cube([offset_x, sg5010_d, 4]);
            translate([60-offset_x, 20, 0]) cube([offset_x, sg5010_d, 4]);
        }
        union()
        {
            translate([10, 10, -0.1]) cylinder(r=screw_8_size()/2,h=10);
            translate([30, 10, -0.1]) cylinder(r=screw_8_size()/2,h=10);
            translate([50, 10, -0.1]) cylinder(r=screw_8_size()/2,h=10);
            translate([offset_x-sg5010_mount_rad-2, 23+sg5010_mount_rad, -0.1])
                cylinder(r=screw_8_size()/2,h=10);
            translate([offset_x-sg5010_mount_rad-2, 32.81+sg5010_mount_rad, -0.1])
                cylinder(r=screw_8_size()/2,h=10);
            translate([60-offset_x+sg5010_mount_rad+2, 23+sg5010_mount_rad, -0.1])
                cylinder(r=screw_8_size()/2,h=10);
            translate([60-offset_x+sg5010_mount_rad+2, 32.81+sg5010_mount_rad, -0.1])
                cylinder(r=screw_8_size()/2,h=10);
        }
    }
}

module bbs_sg5010_actuater_1()
{
    difference()
    {
        union()
        {
            hull()
            {
                cylinder(r=4.1, h=2.1);
                translate([17, 0, 0]) cylinder(r=4.72/2, h=2.1);
            }
            cylinder(r=8.26/2, h=6);
        }
        union()
        {
            translate([0, 0, -0.1]) cylinder(r=3/2,h=7);
            translate([0, 0, 2]) cylinder(r=5.9/2, h=7);
        }
    }
}

module bbs_sg5010_actuater_4()
{
    union()
    {
        bbs_sg5010_actuater_1();
        rotate([0, 0, 90]) bbs_sg5010_actuater_1();
        rotate([0, 0, 180]) bbs_sg5010_actuater_1();
        rotate([0, 0, 270]) bbs_sg5010_actuater_1();
    }
}

//
// The module defines a plate with 20mm x 20mm hole spacing with a 10mm border around the edge.  It
// can be attached to extrusions and used to mount other items.
//
module bbs_sg5010_actuator_plate(length, width)
{
    size_x = length*20;
    size_y = width*20;
    size_z = 4;
    hole_rad = screw_8_size()/2;
    $nf = 10;
    offset_x = -size_x/2;
    offset_y = -size_y/2;
    difference()
    {
        union()
        {
            translate([offset_x, offset_y, 0]) cube([size_x, size_y, size_z]);
            cylinder(r=8.26/2, h=6);
        }
        union()
        {
            for(x = [10:20:size_x - 10])
            {
                for(y = [10:20:size_y - 10])
                {
                    if (!((x == -offset_x) && (y == -offset_y)))
                    {
                        translate([offset_x + x, offset_y + y, -0.1]) cylinder(r=hole_rad, h=size_z + 0.2);
                    }
                }
            }
                        translate([0, 0, -0.1]) cylinder(r=3/2,h=7);
                        translate([0, 0, 2]) cylinder(r=5.9/2, h=7);
            //
            // This is added to make it easier to lift a corner for removal from the
            // printer.  It can be eliminated, if not needed.
            //
            translate([offset_x + 5,offset_y - 0.1, -0.1]) cube([1, 2, 2]);
        }
    }
}


//translate([24, 0, -sg5010_f]) color("blue") bbs_sg5010();
//rotate([-90, 0, 0]) bbs_sg5010_clip();
//bbs_sg5010_actuater_4();
//bbs_sg5010_actuator_plate(3, 3);
bbs_sg5010_bracket();

