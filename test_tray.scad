//
// Carrier for Rapsberry Pi 3
//
// A Raspberry Pi 3 is mounted on the carrier and then the carrier slides into
// a frame.
//
use <bbs_RaspberryPi3.scad>
use <bbs_arduino.scad>
//use <bbs_half_breadboard.scad>
use <bbs_tray.scad>
//use <bbs_lcd7.scad>
standoff = 5;

pi_x = 45;
pi_y = 75;
ar_x = 45;
ar_y = 15;

module bbs_pi_carrier()
{
    difference()
    {
        union()
        {
            bbs_tray();
            translate([pi_x, pi_y, 3]) rPi3_standoffs(standoff, 2.8, 12);
            translate([ar_x, ar_y, 3]) bbs_arduino_mega2560_standoffs(standoff, 2.8, 12);
        }
        union()
        {
            translate([pi_x, pi_y, -2]) rPi3_standoffs(standoff + 6, 1.5, 12);
            translate([ar_x, ar_y, -2]) bbs_arduino_mega2560_standoffs(standoff + 6, 1.5, 12);
            translate([10, 15, -1]) minkowski()
            {
                cube([40, 130, 10]);
                cylinder(r=1, h=10);
            }
            translate([147, 15, -1]) minkowski()
            {
                cube([40, 130, 10]);
                cylinder(r=1, h=10);
            }
            translate([75, 15, -1]) minkowski()
            {
                cube([25, 130, 10]);
                cylinder(r=1, h=10);
            }
        }
    }
}

bbs_pi_carrier();
//color("red") translate([pi_x, pi_y, standoff + 4]) bbs_rPi3();
//color("green") translate([ar_x, ar_y, standoff + 4]) bbs_arduino_mega2560();
