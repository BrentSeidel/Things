//
// Test coupon
//
use <bbs_connectors.scad>
use <bbs_switches.scad>

module coupon()
{
    difference()
    {
        cube([40, 30, 2]);
        union()
        {
            translate([20, 13, -0.1]) bbs_rj45_panel_cutout(2.2);
//            translate([10, 23, -0.1]) bbs_bannana_connector_cutout(2.2);
        }
    }
}

coupon();
