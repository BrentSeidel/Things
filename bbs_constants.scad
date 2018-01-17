//
// This is a collection of constants that are often needed in various models.
//
// Use functions for constants that should be exported
//
// Sizes for the mini rack
//
function bbs_mini_rack_width() = 72;
function bbs_mini_rack_length() = 100;
//
// Sizes for the standard size rack
//
function bbs_std_rack_width() = 161;
function bbs_std_rack_length() = 200;
//
// Sizes for screw holes.  These are composed of the measured diameter plus a little "fudge factor" to be
// determined.  This is necessary since the printer makes holes a little smaller than they should be
// and to provide a little clearance.
//
function screw_2_size() = 2.10 + 0.25;
function screw_4_size() = 2.80 + 0.15;
function screw_6_size() = 3.38 + 0.3;
function screw_8_size() = 4.06 + 0.3;
