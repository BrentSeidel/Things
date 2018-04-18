//
// This file contains a set of models for working with small servo motors.
//
use <bbs_constants.scad>
//--------------------------------
//
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
            cube([40.72, 20.5, 38]);
            translate([-6.69, 7.08, 2.4]) cube([6.7, 7.72, 4.5]);
            translate([-7.5, 0, 27.86]) cube([54.70, 20.5, 2.54]);
        }
        union()
        {
            translate([-(3.10+mount_rad), 2.95+mount_rad, 20]) cylinder(r=mount_rad,h=40);
            translate([-(3.10+mount_rad), 12.81+mount_rad, 20]) cylinder(r=mount_rad,h=40);
            translate([42.83+mount_rad, 2.95+mount_rad, 20]) cylinder(r=mount_rad,h=40);
            translate([42.83+mount_rad, 12.81+mount_rad, 20]) cylinder(r=mount_rad,h=40);
        }
    }
}
//
// Clips for SG-5010 servo.  One is a full clip and the other two are half clips.
//
module bbs_sg5010_clip_l()
{
    mount_rad=4.0/2;
    difference()
    {
        union()
        {
            cube([20, 20, 4]);
            translate([20, 0, 0]) cube([3, 20, 20 + 4]);
            translate([23, 0, 20]) cube([16, 20, 4]);
            translate([15, 18, 4]) cube([7, 2, 20]);
        }
        union()
        {
            translate([10, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            translate([20-mount_rad, 15, 3+mount_rad]) rotate([-90, 0, 0]) cylinder(r=mount_rad,h=10);
            translate([20-mount_rad, 15, 12.81+mount_rad]) rotate([-90, 0, 0]) cylinder(r=mount_rad,h=10);
        }
    }
}
//
module bbs_sg5010_clip_r()
{
    scale([-1,1,1]) bbs_sg5010_clip_l();
}
//
module bbs_sg5010_clip()
{
    mount_rad=4.0/2;
    difference()
    {
        union()
        {
            cube([20, 20, 4]);
            translate([20, 0, 0]) cube([3, 20, 20 + 4]);
            translate([23, 0, 20]) cube([42, 20, 4]);
            translate([15, 18, 4]) cube([7, 2, 20]);
//
            translate([64, 0, 0]) cube([3, 20, 20 + 4]);
            translate([64, 0, 0]) cube([20, 20, 4]);
            translate([67, 18, 4]) cube([7, 2, 20]);
        }
        union()
        {
            translate([7, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            translate([20-mount_rad, 15, 3+mount_rad]) rotate([-90, 0, 0]) cylinder(r=mount_rad,h=10);
            translate([20-mount_rad, 15, 12.81+mount_rad]) rotate([-90, 0, 0]) cylinder(r=mount_rad,h=10);
//
            translate([77, 10, -0.1]) cylinder(r=screw_m4_size()/2, h=4.2, $fn=10);
            translate([67.83+mount_rad, 15, 3+mount_rad]) rotate([-90, 0, 0]) cylinder(r=mount_rad,h=10);
            translate([67.83+mount_rad, 15, 12.81+mount_rad]) rotate([-90, 0, 0]) cylinder(r=mount_rad,h=10);
        }
    }
}


//translate([24, 0, -28]) color("blue") bbs_sg5010();
rotate([-90, 0, 0]) bbs_sg5010_clip();
