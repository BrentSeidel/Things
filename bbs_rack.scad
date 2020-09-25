//
// Extendable rack for trays
//
use <bbs_constants.scad>
use <bbs_shapes.scad>

screw_rad = 4.5/2;
//
// Set this to be a reasonable height limit for your printer
//
arbitrary_printer_limit = 150;
//
// The module is provided in two versions.  In the _raw version, the length and width can be set to any
// size in units of 1mm.  In the non-_raw version, the length and width are set in units of frames (same
// as the height).  This is basically 20mm units with a little bit of processing.  Note that since the
// values are actually floating point, you can select any value, but don't do that.
//
// Set rack_width and rack_length to appropriate sizes for rack.  Currently functions for standard (std)
// and mini sizes are available, or you can pick your own size.
//
// The parameter "frames" sets the height of the rack in number of screw holes.  The base rack with no
// screw holes is actually one frame tall.  Setting this parameter to less than 1 will probably not
// provide satisfactory results.
//
module bbs_rack(frames_wide, frames_long, frames_high)
{
    bbs_rack_raw(frames_wide*20 + 10, (frames_long + 1)*20, frames_high);
}
//
module bbs_rack_raw(rack_width, rack_length, frames)
{
    $fn=20;
    height = frames*20 + 15;
    if (height > arbitrary_printer_limit)
    {
        echo("Warning: object height of ", height, "might cause problems.");
    }
    rail_offset = 3;
    difference()
    {
        union()
        {
            //
            // Frame
            //
            cube([5, rack_width + 5, 5]);
            cube([rack_length, 5, rail_offset+12]);
            cube([15, 4, height]);
            translate([0, rack_width+5, 0]) cube([rack_length, 5, rail_offset+12]);
            translate([0, rack_width+6, 0]) cube([15, 4, height]);
            translate([rack_length-5, 0, 0]) cube([5, rack_width+10, 3.5]);
            translate([rack_length-15, 0, 0]) cube([15, 4, height]);
            translate([rack_length-15, rack_width + 5, 0]) cube([15, 4, height]);
            translate([0, 0, height+5]) rotate([0, 90, 0]) bbs_prism2(10, rack_length);
            translate([0, rack_width+10, height+5]) rotate([270, 0, 0]) rotate([0, 90, 0]) 
                    bbs_prism2(10, rack_length);
            //
            // Flanges
            //
            translate([0, 0, 5]) cube([2, 15, height]);
            translate([0, rack_width - 5, 5]) cube([2, 15, height]);
            translate([rack_length - 2, 0, 15 + rail_offset]) cube([2, 15, height - 10 - rail_offset]);
            translate([rack_length - 2, rack_width - 5, 15 + rail_offset])
                    cube([2, 15, height - 10 - rail_offset]);
            translate([5, 0, 12]) cube([rack_length - 5, 2, height - 10]);
            translate([5, rack_width + 8, 12]) cube([rack_length - 5, 2, height - 10]);
            //
            translate([5, 5, 0]) cube([rack_length - 10, 10, 5]);
            translate([5, rack_width - 5, 0]) cube([rack_length - 10, 10, 5]);
            translate([0, 5, height + 3]) cube([rack_length, 10, 2]);
            translate([0, rack_width - 5, height + 3]) cube([rack_length, 10, 2]);
            //
            // Some bevels on the top flanges this improves printing the top flanges.
            //
            translate([0, 5, height + 1 ]) rotate([11, 0, 0]) cube([rack_length, 10, 2]);
            translate([0, rack_width - 5, height + 3]) rotate([-11, 0, 0])
                    cube([rack_length, 10, 2]);
            //
            // Other little bits and pieces mostly for support
            //
            translate([rack_length - 2, 4, 15 + rail_offset]) rotate([0, 0, 0]) rotate([0, 90, 0])
                    bbs_prism2(5, 2);
            translate([rack_length - 2, rack_width + 5, 15 + rail_offset]) rotate([270, 0, 0])
                    rotate([0, 90, 0]) bbs_prism2(4, 2);
            //
            //  Side stiffeners
            //
            for(a = [23:22:rack_length-40])
            {
                translate([a + 10, 2, rail_offset+12]) cube([1, 3, height-rail_offset-12]);
                translate([a + 10, rack_width+5, rail_offset+12]) cube([1, 3, height-rail_offset-12]);
            }
        }
        //
        // Parts describing things to be removed
        //
        union()
        {
            //
            // Slides for rails
            //
            translate([2, 5.01, 11 + rail_offset]) rotate([0, 90, 0]) rotate([0, 0, -90])
                    bbs_prism1(5.02, rack_length);
            translate([2, rack_width + 4.99, 6 + rail_offset]) rotate([0, 90, 0])
                    rotate([0, 0, 90]) bbs_prism1(5.02, rack_length);
            //
            // Mounting screw holes - horizontal
            //
            for(a = [20 + rail_offset:20:height])
            {
                translate([10, -1, a]) rotate([-90, 0, 0]) cylinder(r=screw_rad, h=rack_width+20);
                translate([rack_length -10, -1, a]) rotate([-90, 0, 0])
                        cylinder(r=screw_rad, h=rack_width+20);
                translate([-1, 10, a]) rotate([0, 90, 0]) cylinder(r=screw_rad, h=rack_length+10);
                translate([-1, rack_width, a]) rotate([0, 90, 0])
                        cylinder(r=screw_rad, h=rack_length+10);
            }
            //
            // Mounting screw holes - vertical
            //
            for(a = [20:20:rack_length-10])
            {
                translate([a, 10, -1]) cylinder(r=screw_rad, h=height + 10);
                translate([a, rack_width, -1]) cylinder(r=screw_rad, h=height + 10);
            }
            //
            // Side vents
            //
            for(a = [23:22:rack_length-20])
            {
                translate([a, -1, 17+rail_offset]) rotate([-90, 0, 0]) hull() 
                {
                    translate([0, -3, 0]) cylinder(r=7.5, h=rack_width+20);
                    translate([0, -(height-25-rail_offset), 0]) cylinder(r=5, h=rack_width+20);
                }
            }
            //
            // Round off a couple corners
            //
            translate([rack_length-2.5, 15.01, rail_offset+14.99]) rotate([180, 0, 0])
                    rotate([0, 90, 0]) bbs_fillet(5, 3);
            translate([rack_length-2.5, rack_width-5.01, rail_offset+14.99])
                    rotate([90, 0, 0]) rotate([0, 90, 0]) bbs_fillet(5, 3);
        }
    }
}

union()
{
    bbs_rack(2, 5, 2);
//    translate([2, 5, 5 + 3]) color("red") bbs_tray();
//    translate([rack_length + 2, 0, 18])rotate([0, 270, 0]) color("blue") bbs_panel(2);
}
