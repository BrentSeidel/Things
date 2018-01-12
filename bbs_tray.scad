//
// Basic sliding tray to mount in a rack.  Varients of this tray can
// hold different electronic devices.  The knobs parameter is a boolean
// to determine in knobs are added to the tray (the default) or not.
// One may wish to omit the knobs if, for example, one wants a panel to
// cover the tray.
//
use <bbs_constants.scad>
use <bbs_shapes.scad>
//
// Set rack_width and rack_length to appropriate sizes for rack.  Currently functions for standard (std)
// and mini sizes are available, or you can pick your own size.
//
rack_width = bbs_std_rack_width() - 1;
rack_length = bbs_std_rack_length() - 2;

module bbs_tray(knobs=true)
{
    difference()
    {
        union()
        {
            cube([rack_length, rack_width, 3], center=false); // Base
            translate([0, 0, 6]) rotate([0, 90, 0]) rotate([0, 0, -90]) bbs_prism1(5, rack_length); // Rail
            translate([0, rack_width, 1]) rotate([0, 90, 0]) rotate([0, 0, 90])
                    bbs_prism1(5, rack_length); // Rail
            translate([0, 0, 0]) cube([rack_length, 8, 7], center=false); // Side
            translate([0, rack_width - 8, 0]) cube([rack_length, 8, 7], center=false); // Side
//
            if (knobs)
            {
                translate([rack_length, 3, 4]) rotate([0, 90, 0]) cylinder($fn=12, h=5, r=3);
                translate([rack_length + 5, 0, 0]) cube([5, 8, 8], center=false); // Knob
                translate([rack_length, rack_width - 4, 4]) rotate([0, 90, 0]) cylinder($fn=12, h=5, r=3);
                translate([rack_length + 5, rack_width - 8, 0]) cube([5, 8, 8], center=false); // Knob
            }
        }
        union()
        {
        }
    }
}

bbs_tray(false);
