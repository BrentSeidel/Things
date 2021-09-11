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
// The module is provided in two versions.  In the _raw version, the length and width can be set to any
// size in units of 1mm.  In the non-_raw version, the length and width are set in units of frames (same
// as the height).  This is basically 20mm units with a little bit of processing.  Note that since the
// values are actually floating point, you can select any value, but don't do that.
//
//
// Set rack_width and rack_length to appropriate sizes for rack.  Currently functions for standard (std)
// and mini sizes are available, or you can pick your own size.
//
//rack_width = bbs_std_rack_width() - 1;
//rack_length = bbs_std_rack_length() - 2;
//
// The parameter "frames" sets the height of the rack in number of screw holes.  The base rack with no
// screw holes is actually one frame tall.  Setting this parameter to less than 1 will probably not
// provide satisfactory results.
//
module bbs_tray(frames_wide, frames_long, frames_high)
{
    bbs_tray_raw(frames_wide*20 + 9, (frames_long + 1)*20 - 2, frames_high);
}
//
module bbs_tray_raw(rack_width, rack_length, knobs=true)
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

bbs_tray(2, 2, false);
