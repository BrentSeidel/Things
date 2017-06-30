//
// RJ45 jack
// Shaxon 110-Type Keystone Jack.  Found at Fry's Electronics
//
module bbs_rj45()
{
    union()
    {
        cube([13.63, 16.09, 16.48], center=false);
        translate([13.63, -0.15, 0]) cube([16.11, 16.39, 12.92], center=false);
        translate([28.56, (16.09-14.63)/2, -2.47]) cube([1.52, 14.63, 2.47], center=false);
        translate([15.40, 1.91, -3.03]) cube([3.76, 12.45, 3.03], center=false);
        translate([6.14, 1.91, -3.03]) cube([12.30, 12.45, 1.36], center=false);
    }
}


bbs_rj45();
