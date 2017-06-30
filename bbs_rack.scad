//
// Extendable rack for trays
//

use <bbs_shapes.scad>
use <bbs_tray.scad>
use <bbs_panel.scad>

//height = 115;
width = 161;
length = 200;
screw = 4.1/2;

module bbs_rack(frames)
{
    $fn=20;
    height = (frames+1)*20 + 15;
    rail_offset = 3;
    difference()
    {
        union()
        {
            //
            // Frame
            //
            cube([5, 170, 5]);
            cube([length, 5, 12 + rail_offset]);
            cube([5, 5, height]);
            translate([0, width + 5, 0]) cube([length, 5, 12 + rail_offset]);
            translate([0, width + 5, 0]) cube([5, 5, height]);
            translate([length - 5, 0, 0]) cube([5, width + 10, 3.5]);
            translate([length - 5, 0, 0]) cube([5, 5, height]);
            translate([length - 5, width + 5, 0]) cube([5, 5, height]);
            translate([0, 0, height + 5]) rotate([0, 90, 0]) bbs_prism2(10, length);
            translate([0, width + 10, height + 5]) rotate([270, 0, 0]) rotate([0, 90, 0]) bbs_prism2(10, length);
            //
            // Flanges
            //
            translate([0, 5, 5]) cube([2, 10, height]);
            translate([0, width - 5, 5]) cube([2, 10, height]);
            translate([length - 2, 5, 15 + rail_offset]) cube([2, 10, height - 10 - rail_offset]);
            translate([length - 2, width - 5, 15 + rail_offset]) cube([2, 10, height - 10 - rail_offset]);
            translate([5, 0, 12]) cube([length - 5, 2, height - 10]);
            translate([5, width + 8, 12]) cube([length - 5, 2, height - 10]);
            //
            translate([5, 5, 0]) cube([length - 10, 10, 2]);
            translate([5, width - 5, 0]) cube([length - 10, 10, 2]);
            translate([0, 5, height + 3]) cube([length, 10, 2]);
            translate([0, width - 5, height + 3]) cube([length, 10, 2]);
            //
            // Some bevels on the top flanges this improves printing the top flanges.
            //
            translate([0, 5, height + 1 ]) rotate([11, 0, 0]) cube([length, 10, 2]);
            translate([0, width - 5, height + 3]) rotate([-11, 0, 0]) cube([length, 10, 2]);
            //
            // Other little bits and pieces mostly for support
            //
            translate([length - 2, 5, 15 + rail_offset]) rotate([0, 0, 0]) rotate([0, 90, 0]) bbs_prism2(4, 2);
            translate([length - 2, width + 5, 15 + rail_offset]) rotate([270, 0, 0]) rotate([0, 90, 0]) bbs_prism2(4, 2);
            for(a = [30:20:length - 30])
            {
                translate([a, 0, height + 3]) rotate([0, 90, 0]) bbs_prism2(15, 2);
                translate([a, width + 10, height + 3]) rotate([270, 0, 0]) rotate([0, 90, 0]) bbs_prism2(15, 2);
            }
        }
        //
        // Parts describing things to be removed
        //
        union()
        {
            //
            // Slides fpr rails
            //
            translate([2, 5.01, 11 + rail_offset]) rotate([0, 90, 0]) rotate([0, 0, -90]) bbs_prism1(5.02, length);
            translate([2, width + 4.99, 6 + rail_offset]) rotate([0, 90, 0]) rotate([0, 0, 90]) bbs_prism1(5.02, length);
            //
            // Mounting screw holes - horizontal
            //
            for(a = [20 + rail_offset:20:height])
            {
                translate([10, -1, a]) rotate([-90, 0, 0]) cylinder(r=screw, h=width+20);
                translate([length -10, -1, a]) rotate([-90, 0, 0]) cylinder(r=screw, h=width+20);
                translate([-1, 10, a]) rotate([0, 90, 0]) cylinder(r=screw, h=length+20);
                translate([-1, width, a]) rotate([0, 90, 0]) cylinder(r=screw, h=length+20);
            }
            //
            // Mounting screw holes - vertical
            //
            for(a = [20:20:length-10])
            {
                translate([a, 10, -1]) cylinder(r=screw, h=height + 20);
                translate([a, width , -1]) cylinder(r=screw, h=height + 20);
            }
            //
            // Side vents
            //
            for(a = [20:20:length-20])
            {
                translate([a, -1, 17 + rail_offset]) rotate([-90, 0, 0]) hull() 
                {
                    translate([0, -3, 0]) cylinder(r=7.5, h=width + 20);
                    translate([0, -(height - 25 - rail_offset), 0]) cylinder(r=5, h=width + 20);
                }
            }
            //
            // Round off a couple corners
            //
            translate([length - 2.5, 15.01, 14.99 + rail_offset]) rotate([180, 0, 0]) rotate([0, 90, 0])bbs_fillet(5, 3);
            translate([length - 2.5, width - 5.01, 14.99 + rail_offset]) rotate([90, 0, 0])rotate([0, 90, 0]) bbs_fillet(5, 3);
        }
    }
}

union()
{
    bbs_rack(2);
//    translate([1, 5, 5 + 3]) color("red") bbs_tray();
//    translate([length + 2, 0, 18])rotate([0, 270, 0]) color("blue") bbs_panel(2);
}
