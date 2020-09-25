//
// This is a collection of definitions giving measurements for various sizes of PVC pipe.  Sizes are returned
// in milimeters.  Data from https://flexpvc.com/Reference/PVCPipeSize.shtml is used.  In some cases the size
// is only provided in inches so is multipled by 25.4 to convert to milimeters.
//
// The nominal size of the pipe is the inside diameter for pipes smaller than 14 inches.  The outside
// diameter has a tolerance provided of 0.25mm, while the inside diameter tolerence is 5% (or more).
//
// The function names include the schedule (40 or 80) and the size with any dashes or slashes replaced
// by underscores followed by (id or od) for inside and outside diameter.  This 1-1/4 inch schedule 80
// pipe would have the outside diameter given by pvc_80_1_1_4_od().
//
// Sizes for schedule 40 pipe.
//
function pvc_40_1_8_od() = 10.31;
function pvc_40_1_8_id() = 0.249*25.4;
function pvc_40_1_4_od() = 13.75;
function pvc_40_1_4_id() = 0.344*25.4;
function pvc_40_3_8_od() = 17.14;
function pvc_40_3_8_id() = 0.473*25.4;
function pvc_40_1_2_od() = 21.33;
function pvc_40_1_2_id() = 0.622*25.4;
function pvc_40_3_4_id() = 26.67;
function pvc_40_3_4_od() = 0.824*25.4;
function pvc_40_1_od() = 33.401;
function pvc_40_1_id() = 1.049*25.4;
function pvc_40_1_1_4_od() = 42.164;
function pvc_40_1_1_4_id() = 1.380*25.4;
function pvc_40_1_1_2_od() = 48.260;
function pvc_40_1_1_2_id() = 1.610*25.4;
function pvc_40_2_od() = 60.325;
function pvc_40_2_id() = 2.067*25.4;
function pvc_40_2_1_2_od() = 73.025;
function pvc_40_2_1_2_id() = 2.469*25.4;
function pvc_40_3_od() = 88.900;
function pvc_40_3_id() = 3.068*25.4;
function pvc_40_4_od() = 114.300;
function pvc_40_4_id() = 4.026*25.4;
function pvc_40_5_od() = 141.300;
function pvc_40_5_id() = 5.047*25.4;
function pvc_40_6_od() = 168.275;
function pvc_40_6_id() = 6.065*25.4;
//
// Sizes for schedule 80 pipe
//
function pvc_80_1_8_od() = 10.31;
function pvc_80_1_8_id() = 0.195*25.4;
function pvc_80_1_4_od() = 13.75;
function pvc_80_1_4_id() = 0.282*25.4;
function pvc_80_3_8_od() = 17.14;
function pvc_80_3_8_id() = 0.403*25.4;
function pvc_80_1_2_od() = 21.33;
function pvc_80_1_2_id() = 0.546*25.4;
function pvc_80_3_4_id() = 26.67;
function pvc_80_3_4_od() = 0.742*25.4;
function pvc_80_1_od() = 33.401;
function pvc_80_1_id() = 0.957*25.4;
function pvc_80_1_1_4_od() = 42.164;
function pvc_80_1_1_4_id() = 1.278*25.4;
function pvc_80_1_1_2_od() = 48.260;
function pvc_80_1_1_2_id() = 1.500*25.4;
function pvc_80_2_od() = 60.325;
function pvc_80_2_id() = 1.939*25.4;
function pvc_80_2_1_2_od() = 73.025;
function pvc_80_2_1_2_id() = 2.323*25.4;
function pvc_80_3_od() = 88.900;
function pvc_80_3_id() = 2.900*25.4;
function pvc_80_4_od() = 114.300;
function pvc_80_4_id() = 3.826*25.4;
function pvc_80_5_od() = 141.300;
function pvc_80_5_id() = 4.768*25.4;
function pvc_80_6_od() = 168.275;
function pvc_80_6_id() = 5.761*25.4;
//
// Additional sizes may be added as needed
//
