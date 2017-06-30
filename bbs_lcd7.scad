//
// 7 inch diagonal LCD panel
// AdaFruit item # 2354
//
module bbs_lcd7()
{
    union()
    {
        cube([165, 100, 3]);
        translate([1, 3, 3]) cube([160, 96, 1]);
        translate([66.6, -6.07, 0]) cube([30.32, 6.07, 0.1]);
        translate([34.7, -6.07, -27.91]) cube([62.49, 0.1, 27.91]);
        translate([34.7, -6.07, -57.8]) cube([20.36, 0.1, 29.97]);
    }
}

bbs_lcd7();
