/*
 *  Queen's Robotics Society
 *  Antweight Battlebot
 *
 *  Designed in 2024 by
 *  - alex barnes (@atctwo)
 *
 *  This bot looks like the following things:
 *  - a cat
 *  - the data storage symbol in flowchart-based software design
 *  - a logical OR gate (or NOR if you consider the spinner an inversion circle)
 */

use <MCAD/boxes.scad>
use <micro_metal_bracket.scad>

///////////////////////////////////////////
//
//    Parameters
//
///////////////////////////////////////////

/* [Base Dimensions] */

// base width of the whole bot
base_w_raw = 140;

// base length of the whole bot
base_d_raw = 140;

// base height of the whole bot chassis
base_h = 40;

/* [Plough Dimensions] */

// width of the plough
plough_w = 30;

// length of the plough
plough_d = base_d_raw;

// height of the plough
plough_h = base_h;

// offset of the curve which makes the plough
plough_offset = [10, 0, 0];

// rotation of the plough
plough_rotation = [0, 0, 0];

/* [Weapon Section of Chassis] */

// width of the curved bit which holds the weapon
weapon_w = 42;

// length of the curved bit
weapon_d = base_d_raw;

// height of the weapon
weapon_h = base_h;

/* [Weapon Size and Position] */

// diameter of the spinner
weapon_diameter = 60.33;

// thickness of the spinner
weapon_thickness = 3;

// extra diameter to add to the spinner to make the hole wider
weapon_diameter_padding = 5;

// extra thickness to add to the spinner to make the hole taller
weapon_thickness_padding = 10;

// height from the top of the bottom lid that the spinner sits (ie: motor height)
weapon_z = 18.5;

// diameter of the spinner motor
weapon_motor_diameter = 23;

// if the motor eats into the main chassis, pad it by this much
weapon_motor_padding = 3;

// extra offset for the motor and spinner
weapon_offset = [15.4, 0, 0];

// diameter of weapon screw holes (main body)
weapon_mount_screw_cd1 = 2.5;

// diameter of weapon screw holes (countersink)
weapon_mount_screw_cd2 = 3.8;

// size of the countersunk head of weapon screw holes
weapon_mount_screw_ch = 1.4;

// positions of the screws holes for the weapon (expressed as distances from the motor axle)
weapon_mount_screws = [
    [0,-8], [0,8],
    [-6,0], [6,0]
];

// do you want a big hole where the axle sticks out the bottom of the motor?
weapon_axle_hole_d = 4.5;

// how deep do you want that hole to be?  as a percent of the lid thickness
weapon_axle_hole_h = 0.5;

// thickness of the protective walls around the spinner
weapon_wall_thickness = 2;

// gap between the spinner area and the protective walls (note: other interior stuff has a separate variable, interior_wall_gap)
weapon_wall_gap = 2;

/* [Chassis Features] */

// whether to make a big hole for the spinner to extend out of
chassis_show_weapon_hole = true;

/* [Interior and Lid Dimensions] */

// thickness of the shell's walls
interior_wall_thickness = 2.5;

// thickness of the lids
interior_lid_thickness = 3;

// gap between outer edge of lids and inner edge of interior
interior_lid_gap = 0.5;

// how thick the interior shelf should be
interior_shelf_thickness = 2.5;

// width of the lid mounting posts
interior_lid_mounting_w = 10;

// length of the lid mounting posts
interior_lid_mounting_d = 10;

// radius of the lid mounting posts
interior_lid_mounting_r = 2;

// diameter of the mounting hole
interior_lid_mounting_hole_d = 4;  // M3 brass insert

// screw diameters have 0.5mm added for normal padding, and an extra 0.4mm for my shrinky filament

// screw hole diameter
interior_lid_mounting_hole_cd1 = 3.5;

// screw hole countersink diameter
interior_lid_mounting_hole_cd2 = 6.2;

// height of the screw head
interior_lid_mounting_hole_ch = 2.5;

// min gap between interior features and the shelf (note: weapon has a separate variable, weapon_wall_gap)
interior_wall_gap = 4.0;

/* [Lid Mounting Hole Positions] */

// how far along the x axis the top left post is
lid_mh_tlw = 0.8; // .1

// how far along the x axis the bottom left post is
lid_mh_blw = 1.8; // .1

// how far along the x axis the top right post is
lid_mh_trw = 0.8; // .1

// how far along the x axis the bottom right post is
lid_mh_brw = 1.8; // .1

// how far along the y axis the top left post is
lid_mh_tld = 1.0; // .1

// how far along the y axis the top right post is
lid_mh_trd = 1.0; // .1

// how far along the y axis the top left post is
lid_mh_bld = 0.9; // .1

// how far along the y axis the top right post is
lid_mh_brd = 0.9; // .1

/* [Interior and Lid Features] */

// which gearbox / motors to enable
interior_gearbox = "micro"; // [none:None, double:Tamiya Double Gearbox, micro:Micro Metal Gearboxes]

// whether to make holes for the screws to attach the lid to the chassis
interior_show_screw_holes = true;

// whether to make holes in the lid for wheels
interior_show_wheels = true;

// whether to show walls around the wheel areas
interior_show_wheel_walls = true;

// whether to create any mounting stuff for the selected gearbox
interior_show_gearbox_mounting = true;

// whether to create walls around the spinner area
interior_show_weapon_walls = true;

// whether to have a wee hole for the wires to go out of
interior_weapon_wall_hole = true;

// diameter of the hole
interior_weapon_wall_hole_d = 5;

// angle along the weapon wall to have the hole
interior_weapon_wall_hole_a = 45;

// padding to add to things on the interior that go up against the inner shelf
interior_padding_against_shelf = 1;

// power switch position x coord
interior_power_switch_x = 48;

// power switch position z offset (by default it's in the middle)
interior_power_switch_z_offset = 0;

// size of the hole to make for the power switch
interior_power_switch_hole = [8, 4.5];

// diameter of the holes to make for the switch mounts
interior_power_switch_mount_d = 1.75;

// depth of the holes to make for the switch mounts
interior_power_switch_mount_h = 4;

/* [Wheels and Gearbox Size and Position] */

// thickness / tread size of the wheels
wheel_tread = 19; // .1

// padding to add to the wheel holes for the tread
wheel_tread_padding = 3; // .1

// diameter of the wheels
wheel_diameter = 42; // .1

// extra diameter to add to the wheels to make the holes bigger
wheel_diameter_padding = 5; // .1

// distance of the centres of the two wheels from the centre of the robot
wheel_separation = 96; // .1

// vector by which to offset the wheels from the centre of the bot
wheel_offset = [15, 0, 0]; //.1

// diameter of the gearbox axel
wheel_axel_d = 3; // .1

// thickness of the wheel walls
wheel_wall_thickness = 2; // .1

// radius of the corners on the wheel walls
wheel_wall_radius = 2; // .1

// radius of the blocks that make up the gearbox mount
gearbox_mount_radius = 2; // .1

/* [Lid Decoration] */

// how deep the rescess of decorations are on the lids
lid_decoration_depth = 1.5;

// offset of the main decoration (qrs logo, whiskers)
lid_main_decoration_offset = [-25, 0, 0];

// whether to show the QRS logo on the lids
lid_show_qrs_logo = true;

// dpi of the QRS logo on the lids (bigger DPI -> smaller physical size)
qrs_logo_dpi = 425; 

// size of the QRS logo in "pixels" (depends on the SVG file)
qrs_logo_size_px = [491, 400];

// whether to show cat whiskers on the lids
lid_show_whiskers = true;

// length of each whisker
whisker_length = 24;

// thickness of each whisker
whisker_thickness = 4;

// radius of the corners on each whisker
whisker_radius = 1.2;

// distance between each whisker and the qrs logo
whisker_distance = -(whisker_length/2) + 5; // center = true
// whisker_distance = 5; // center = false

// the angle at which the top and bottom whiskers are rotated
whisker_rotation = 18;

/* [TPU Shielding] */

// gap between the tpu shielding and the outside of the chassis (eats into the tpu thickness)
tpu_gap = -1; // .1

// starting thickness of the TPU shielding
tpu_thickness_raw = 3;

// whether to show a gap in the shielding for the spinner
tpu_show_weapon_hole = true;

/* [Calculated Variables] */

// what's the real value of the tpu thickness?  the tpu gap eats into the tpu thickness, so
// this makes sure the value specified as the thickness accounts for how much will be lost
// to the gap
tpu_thickness = tpu_gap + tpu_thickness_raw;

// previous versions of the bot had the body size dependant on the tpu shielding size.
// this was messing up the interface between the bot and the shielding, so i decoupled
// the two parameters.  however the dimensions of parts i had already printed still had
// those dependancies so i've hardcoded them here.  in future versions these will hopefully
// be set to zero
old_tpu_thickness = 2;
old_tpu_gap = 1;

// base width of the whole bot, minus the tpu shielding
base_w = base_w_raw - (old_tpu_thickness + old_tpu_gap) * 2;

// base length of the whole bot, minus the tpu shielding
base_d = base_d_raw - (old_tpu_thickness + old_tpu_gap) * 2;

// width of the body
body_w = base_w - weapon_w - plough_w;

// length of the body
body_d = base_d;

// height of the body
body_h = base_h;

// total wheel diameter
wheel_d = wheel_diameter + wheel_diameter_padding;

// total wheel thickness
wheel_h = wheel_tread + wheel_tread_padding;

/* [Visability] */

// whether to show the main chassis
show_main_chassis = true;

// whether to show the top lid
show_top_lid = true;

// whether to show the bottom lid
show_bottom_lid = true;

// whether to show the shelf on the inside of the interior (depends on show_main_chassis)
show_interior_shelf = true;

// whether to show the tpu shielding
show_tpu_shielding = true;

// whether to show the wheels
show_wheels = true;

// whether to show the gearbox's axel
show_gearbox_axel = false;

// whether to show the selected motor / gearbox
show_gearbox = true;

// whether to show the spinner's area
show_weapon = true;

// whether to show the spinner motor
show_weapon_motor = true;

// whether to show the power switch
show_switch = true;

// show the mock lipo battery
show_lipo = false;

// whether to show colour on each of the main sections
show_main_section_colour = true;

// whether to show colour on the interior
show_interior_colour = true;

// whether to show colour on the lids
show_lid_colour = true;

// whether to show colour on the tpu shielding
show_tpu_shielding_colour = true;

// whether to explode the robot! (via openscad's animation menu)
show_exploded = true;

/* [Miscallaneous] */

// curve resolution
$fn = 100;

// lipo battery dimensions
lipo_size = [12.5, 52.5, 17];

// lipo offset
lipo_offset = [95, 40, 15];

///////////////////////////////////////////
//
//    Modules and Functions
//
///////////////////////////////////////////

// creates a semicircle thingy
// d - diameter of the circle
// l - length of the semicircle from the flat edge to the point of the curve
// h - height of the curve
module curve(d, l, h) {
    translate([l, d/2, 0]) {
        scale([l/(d/2), 1, 1]) {
            difference() {
                cylinder(d=d, h=h);
                translate([0, -d/2, -0.5])
                cube([d/2, d, h+1]);
            }
        }
    }
}

// creates four instances of this module's children at the lid
// mounting hole locations
module mounting_holes() {

    // top left
    translate([weapon_w - (interior_lid_mounting_w*lid_mh_tlw), interior_lid_mounting_d*lid_mh_tld, 0])
    children();
    
    // top right
    translate([weapon_w - (interior_lid_mounting_w*lid_mh_trw), base_d - (interior_lid_mounting_d*lid_mh_trd), 0])
    children();

    // bottom left
    translate([base_w - (interior_lid_mounting_w*lid_mh_blw), interior_lid_mounting_d*lid_mh_bld, 0])
    children();

    // bottom right
    translate([base_w - (interior_lid_mounting_w*lid_mh_brw), base_d - (interior_lid_mounting_d*lid_mh_brd), 0])
    children();
}

module explode(h=0) {
    if (show_exploded) {
        hs = ((-(2*$t) ^ 2) + (4*$t)) * h;
        translate([0, 0, hs]) children();
    } else children();
}

///////////////////////////////////////////
//
//    Main Chassis Shape
//
///////////////////////////////////////////

/*
 * The main chassis is made of three main sections:
 * - the weapon end, a curved bit where the spinner sticks out of
 * - the main body, a big rectangle in the middle
 * - the plough, and inverted curve which is designed to push things
 * This module creates a solid object with this shape
*/

module chassis_shape(w, ww, bw, pw, d, pd, h, po=[0,0,0]) {

    render() 
    {

        // weapon
        weapon_c = show_main_section_colour ? "red" : undef;
        color(weapon_c)
        curve(d, ww, h);
        
        // body
        body_c = show_main_section_colour ? "green" : undef;
        color(body_c)
        translate([ww, 0, 0])
        cube([bw, d, h]);

        // plough
        plough_c = show_main_section_colour ? "blue" : undef;
        color(plough_c)
        translate([ww + bw, 0, 0])
        difference() {
            cube([pw, d, h]);
            translate([0, 0, -h/2]) translate(plough_offset)    // translate curved bit
            translate(po)
            rotate(plough_rotation)                             // rotate curved bit
            union() {
                curve(pd, pw+0.1, h*2);                         // curved bit
                translate([pw, 0, 0])                           // extension cube to remove bits which aren't clipped
                    cube([pw, d, h*2]);                         // off when rotating
            }
        }

    }

}

///////////////////////////////////////////
//
//    Decoration Modules
//
///////////////////////////////////////////

// old png version of qrs logo
// module qrs_logo() {
//     iw = 307; id = 250; ix = 0.3; iy = 0.3;
//     translate([(iw*ix)+((base_w-(iw*ix))/3), (base_d - (id*iy))/2, 0])
//     scale([ix, iy, 0.05]) rotate([0, 0, 90])
//     surface("./imports/qrs_icon_heightmap_100.png", invert=false);
// }

/*
 * Renders the Queen's Robotics Society logo from an SVG file
 */
module qrs_logo() {
    sizes = qrs_logo_size();
    iw = sizes[0]; id = sizes[1];
    translate([iw/2, -id/2, 0]) rotate([0, 0, 90])
    import("imports/qrs_icon.svg", dpi=qrs_logo_dpi);
}

/*
 * Calculates the actual size of the QRS logo based on the image size and DPI
 */
function qrs_logo_size() = [
    (qrs_logo_size_px[0]/qrs_logo_dpi) * 25.4,
    (qrs_logo_size_px[1]/qrs_logo_dpi) * 25.4
];

module whiskers() {

    sizes = qrs_logo_size();
    iw = sizes[0]; id = sizes[1];

    rw = -(whisker_length/2) + whisker_distance - (id/2);
    lw =  (whisker_length/2) - whisker_distance + (id/2);

    module whisker(dm, am, w) {
        translate([dm*(iw/3), w, 0])
        rotate([0, 0, whisker_rotation * am])
        roundedCube([whisker_thickness, whisker_length, interior_lid_thickness], whisker_radius, sidesonly=true, center=true);
    };

    whisker(-1, -1, rw);  // l1
    whisker(0, 0, rw);    // l2
    whisker(1, 1, rw);    // l3

    whisker(-1, 1, lw);   // r1
    whisker(0, 0, lw);    // r2
    whisker(1, -1, lw);   // r3
}

module lid_main_decoration(show_qrs_logo, qrs_logo_rotation, show_whiskers) {
    sizes = qrs_logo_size();
    iw = sizes[0]; id = sizes[1];
    {

        // QRS logo
        if (show_qrs_logo) {
            rotate([0, 0, qrs_logo_rotation])
            linear_extrude(interior_lid_thickness)
            qrs_logo();
        }

        // translate([-iw/2, -id/2, 0])
        // cube([iw, id, lid_decoration_depth]);

        // whiskers
        translate([0, 0, interior_lid_thickness/2])
        if (show_whiskers) whiskers();
    }
}

///////////////////////////////////////////
//
//    Chassis Interior Shape
//
///////////////////////////////////////////

/*
 * This module creates the shape of the chassis interior.  This is the same basic shape
 * as the main chassis, but with some of the parameters scaled so that the resulting shape
 * is smaller than the main chassis by some amount.
 * That amount is specified by the interior_wall_thickness; the shape returned by this module
 * will be the same as the main chassis but with the specified thickness of wall removed.
 * The idea is that this can be subtracted from the main chassis to create the interior.
 */

module chassis_interior(w, ww, bw, pw, d, h, gap) {

    int_w  = w  - (gap * 2);
    int_ww = ww - (gap * 2);
    int_bw = bw - (gap * 2);
    int_pw = pw - (gap * 2);
    int_d  = d  - (gap * 2);
    int_h  = h * 1;

    translate([((w - int_w) / 2) - 0.005, (d - int_d) / 2, (h - int_h) / 2])
    scale([int_w / w, int_d / d, int_h / h])
    chassis_shape(w, ww, bw, int_pw, base_d, base_d, int_h);

}

///////////////////////////////////////////
//
//    Hollowing out chassis
//
///////////////////////////////////////////

/*
 * The main shell of the bot is created by subtracting the interior shape
 * from the main chassis shape
 */

module chassis_shell() {

    color("#222222")
    difference() {
        union() {
    difference() 
    {
        // outer shell
        chassis_shape(base_w, weapon_w, body_w, plough_w, base_d, base_d, base_h);

        // main big hole
        interior_c = show_interior_colour ? "#00ced1" : undef; color(interior_c)
        translate([0, 0, -0.5])
        chassis_interior(base_w, weapon_w, body_w, plough_w, base_d, base_h + 1, interior_wall_thickness);

        // hole for the spinner
        if (chassis_show_weapon_hole) {
            interior_spinner();
        }
    }

    // shelf inside the chassis to support lids
    if (show_interior_shelf) {
        color("white")
        translate([0, 0, interior_lid_thickness]) {
            
            // shelf
            difference() {
                chassis_interior(base_w, weapon_w, body_w, plough_w, base_d, base_h - (interior_lid_thickness * 2), interior_wall_thickness);
                
                translate([0, 0, -0.5])
                chassis_interior(base_w, weapon_w, body_w, plough_w, base_d, base_h - (interior_lid_thickness * 2)+1, interior_wall_thickness + interior_shelf_thickness);
                
                translate([0, 0, -interior_lid_thickness]) {
                    // hole for the spinner
                    if (chassis_show_weapon_hole) interior_spinner();
                }
            }
        }
            }
        }

        // padding around the motor
        color("Red")
        translate(weapon_offset)
        translate([0, base_d/2, interior_lid_thickness-0.5]) 
        cylinder(d=weapon_motor_diameter+weapon_motor_padding, h=weapon_z+1);

        // switch holes
        translate([
            interior_power_switch_x, 
            0, 
            (base_h/2)+interior_power_switch_z_offset]) {

            // hole for the switch lever
            translate([0, (interior_wall_thickness+interior_shelf_thickness)/2, 0])
            rotate([90,0,0])
            roundedCube([
                interior_power_switch_hole.y,
                interior_power_switch_hole.x,
                interior_wall_thickness+interior_shelf_thickness+1
            ], 1, center=true, sidesonly=true);

            // mounting holes
            translate([0, (interior_wall_thickness+interior_shelf_thickness)+0.5, 7])
            rotate([90, 0, 0])
            cylinder(d=interior_power_switch_mount_h, h=interior_power_switch_mount_d+1);

            translate([0, (interior_wall_thickness+interior_shelf_thickness)+0.5, -7])
            rotate([90, 0, 0])
            cylinder(d=interior_power_switch_mount_h, h=interior_power_switch_mount_d+1);

        }
    }

    // lid mounting posts
    post_h = base_h - (interior_lid_thickness * 2);
    module mounting_post() {
        difference() {

            // mounting post
            roundedCube([
                interior_lid_mounting_w, 
                interior_lid_mounting_d, 
                post_h], 
                interior_lid_mounting_r, sidesonly=true, center=true);

            // mounting hole
            translate([0, 0, 0.25])
            cylinder(d=interior_lid_mounting_hole_d, h=post_h + 1, center=true);
        }
    }

    color("white")
    translate([0, 0, interior_lid_thickness])
    intersection() {
       
        // create mounting posts in the locations of the mounting holes
        translate([0, 0, (post_h) /2])
        mounting_holes() mounting_post();

        // interior shape    
        chassis_interior(base_w, weapon_w, body_w, plough_w, base_d, post_h, interior_wall_thickness);

    }

}

///////////////////////////////////////////
//
//    Interior stuff
//
///////////////////////////////////////////

/*
 * one wheel, on it's own
 */
module wheel() {
    rotate([90, 0, 0]) {
        
        // actual wheel
        color("DimGray")
        translate([0, 0, (wheel_h - wheel_tread) / 2])
        cylinder(d = wheel_diameter, h = wheel_tread);

        // padding
        color("DimGray", 0.2)
        cylinder(d = wheel_d, h = wheel_h);
    }
}

/*
 * both wheels at the specified separation
 */
module interior_wheels() {

    translate(wheel_offset)
    translate([base_w/2, 0, base_h/2]) {

        translate([0, ((base_d+wheel_h)/2) - (wheel_separation/2), 0])
        wheel();

        translate([0, ((base_d+wheel_h)/2) + (wheel_separation/2), 0])
        wheel();

    }
}

/*
 * Walls around the wheel areas to protect the insides from the wheels
 */
module interior_wheel_walls() {

    translate(wheel_offset)
    translate([base_w/2, 0, interior_lid_thickness]) {

        outer_w = wheel_d + (wheel_wall_thickness * 2);
        outer_d = wheel_h + (wheel_wall_thickness * 2);
        wall_h = base_h - (interior_lid_thickness*2);
        gap_w = wheel_axel_d*3;

        difference() {
            // outer wall
            translate([-(outer_w/2), ((base_d)/2) - (wheel_separation/2) - (outer_d/2), 0])
            roundedCube([outer_w, outer_d, wall_h], wheel_wall_radius, sidesonly=true);
            
            // inner wall
            translate([-(wheel_d/2), ((base_d)/2) - (wheel_separation/2) - (wheel_h/2), 0])
            roundedCube([wheel_d, wheel_h, wall_h + 1], wheel_wall_radius, sidesonly=true);
        
            // gap for axel
            translate([-gap_w/2, ((base_d)/2) - (wheel_separation/2) + (wheel_h/2) - (wheel_wall_thickness/2), 0])
            cube([gap_w, wheel_wall_thickness*2, wall_h+1]);
        }

        difference() {
            // outer wall
            translate([-(outer_w/2), ((base_d)/2) + (wheel_separation/2) - (outer_d/2), 0])
            roundedCube([outer_w, outer_d, wall_h], wheel_wall_radius, sidesonly=true);
            
            // inner wall
            translate([-(wheel_d/2), ((base_d)/2) + (wheel_separation/2) - (wheel_h/2), 0])
            roundedCube([wheel_d, wheel_h, wall_h + 1], wheel_wall_radius, sidesonly=true);

            // gap for axel
            translate([-gap_w/2, ((base_d)/2) + (wheel_separation/2) - (wheel_h/2) - (wheel_wall_thickness * 1.5), 0])
            cube([gap_w, wheel_wall_thickness*2, wall_h+1]);
        }

    }

}

/*
 * the gearbox's axel
 */
module interior_gearbox_axel() {
    color("yellow")
    translate(wheel_offset)
    translate([base_w/2, base_d/2, base_h/2])
    rotate([270, 0, 0])
    cylinder(d=wheel_axel_d, h=wheel_separation, $fn=6, center=true);
}

/*
 * A Tamiya Double Gearbox
 */
module interior_gearbox_double() {
    rotate([180, 0, 90])
    translate([24, -8, -8])  // set origin to middle of gearbox
    import("./imports/tamiya_double_gearbox.stl");
}

/*
 * A Micro Metal gearbox
 */
module interior_gearbox_micro() {
    // translate(wheel_offset)
    // translate([base_w / 2, base_d/2, base_h/2])

    // rotate([180, 0, 90])
    // translate([24, -8, -8])  // set origin to middle of gearbox
    
    color("silver")
    translate([-6, 0, 5])
    import("imports/N20 v2.stl");
}

/*
 * Mounting stuff for the Tamiya Double Gearbox
 * Most parameters are specific to this gearbox, so aren't tunable
 * from the main parameters
 */
module interior_gearbox_double_mounting() {

    gearbox_h = 23;
    box_base_w = 70;
    box_base_d = 70;
    box_base_h = (base_h/2) - (gearbox_h/2) - interior_lid_thickness;
    screw_hole_d = 4; // brass insert for M3 screw
    screw_hole_h = 4.1;

    translate(wheel_offset)
    translate([(base_w-box_base_w) / 2, (base_d - box_base_d) / 2, interior_lid_thickness]) {

        difference() {

            // mounting block
            roundedCube([box_base_w-10, box_base_d, box_base_h], gearbox_mount_radius, sidesonly=true);

            // mounting hole L
            translate([(screw_hole_d/2) + 37.3, (screw_hole_d/2) + 3, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

            // mounting hole R
            translate([(screw_hole_d/2) + 38.4, (screw_hole_d/2) + box_base_d - 7, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

        }

    }

}

/*
 * Mounting stuff for the Micro Metal gearbox
 * Most parameters are specific to this gearbox, so aren't tunable
 * from the main parameters
 */
module interior_gearbox_micro_mounting() {

    gearbox_h = 10;
    box_base_w = wheel_diameter + wheel_diameter_padding;
    box_base_d = wheel_separation - (wheel_tread+wheel_tread_padding) - (wheel_wall_thickness*2) - 5;
    box_base_h = (base_h/2) - (gearbox_h/2) - interior_lid_thickness;
    screw_hole_d = 4; // brass insert for M3 screw
    screw_hole_h = 4.1;

    // micro_metal_bracket.scad will echo the bracket dimensions, but remember that the model is rotates 90° here so they're backwards
    bracket_w = 32;
    bracket_d = 24;
    bracket_h = 16;
    bracket_t = 2;
    bracket_x = bracket_t + (box_base_w/2) + 6;
    hole_xd = 14.4;
    hole_yd = 21.1;

    translate(wheel_offset)
    translate([(base_w-box_base_w) / 2, (base_d-box_base_d)/2, interior_lid_thickness]) {

        difference() {

            // mounting block (extra 3mm for lipo to sit on)
            roundedCube([box_base_w+3, box_base_d, box_base_h], gearbox_mount_radius, sidesonly=true);

            /*
            ECHO: "hole offset", 0, "x=", 4.8, "y=", 3
            ECHO: "hole offset", 1, "x=", 19.2, "y=", 3
            ECHO: "hole offset", 0, "x=", 4.8, "y=", 6
            ECHO: "hole offset", 1, "x=", 19.2, "y=", 6
            */

            // mounting hole L1
            translate([(box_base_w/2)-(bracket_d/2), 4.8, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

            // mounting hole L2
            translate([(box_base_w/2)-(bracket_d/2), 19.2, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

            // mounting hole L3
            translate([(box_base_w/2)+(bracket_d/2), 4.8, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

            // mounting hole L4
            translate([(box_base_w/2)+(bracket_d/2), 19.2, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

            // mounting hole R1
            translate([(box_base_w/2)-(bracket_d/2), (box_base_d-bracket_d) + 4.8, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

            // mounting hole R2
            translate([(box_base_w/2)-(bracket_d/2), (box_base_d-bracket_d) + 19.2, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

            // mounting hole R3
            translate([(box_base_w/2)+(bracket_d/2), (box_base_d-bracket_d) + 4.8, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

            // mounting hole R4
            translate([(box_base_w/2)+(bracket_d/2), (box_base_d-bracket_d) + 19.2, box_base_h - screw_hole_h])
            cylinder(d=screw_hole_d, h=screw_hole_h+1);

        }

        // brackets (only shown when the motors are shown, since they're a separate model)
        explode(60) // exploding here since this isn't called at EOF
        if (show_gearbox) {
            // left bracket
            translate([bracket_x, 0, box_base_h])
            rotate([0, 0, 90])
            micro_metal_bracket();

            // right bracket
            translate([bracket_x, box_base_d-bracket_d, box_base_h])
            rotate([0, 0, 90])
            micro_metal_bracket();
        }

    }

}

/*
 * Represents the entire space that could be occupied by the spinner
 */
module interior_spinner() {
    translate(weapon_offset)
    translate([0, base_d/2, interior_lid_thickness + weapon_z]) {
        
        // actual spinner
        // color("Silver")
        color("Crimson") // so it looks like a cat's tongue
        cylinder(d=weapon_diameter, h=weapon_thickness);

        // area with padding, for making holes
        // color("Silver", 0.2)
        // translate([0, 0, -(weapon_thickness_padding)/2])
        // cylinder(
        //     d=weapon_diameter + weapon_diameter_padding, 
        //     h=weapon_thickness + weapon_thickness_padding
        // );

        color("Blue", 0.2)
        hull() {
            st = (weapon_thickness + weapon_thickness_padding) / 2;
            off = 2;

            color("Blue", 0.2)
            // translate([-weapon_offset.x/2, 0, weapon_thickness/2])
            translate([-weapon_offset.x/2, 0, st - (weapon_thickness/2) - off])
        scale([
            weapon_diameter + weapon_diameter_padding, 
            weapon_diameter + weapon_diameter_padding, 
                (weapon_thickness + weapon_thickness_padding)])
            sphere(d=1);

            color("Green", 0.2)
            // translate([-weapon_offset.x/2, 0, weapon_thickness/2])
            translate([-weapon_offset.x/2, 0, (-weapon_thickness/2) + off])
            scale([
                weapon_diameter + weapon_diameter_padding, 
                weapon_diameter + weapon_diameter_padding, 
                (weapon_thickness + weapon_thickness_padding)])
        sphere(d=1);
        }
    }
}

/*
 * The motor which spins the spinner
 */
module interior_motor() {
    color("Red")
    translate(weapon_offset)
    translate([0, base_d/2, interior_lid_thickness]) 
    cylinder(d=weapon_motor_diameter, h=weapon_z);
}

// screw holes for the motor
module weapon_motor_screw_holes() {

    translate([0, 0, -0.1]) {

    // screw hole
    for (screw=weapon_mount_screws) {
        translate([screw.x, screw.y, ]) {
        
            // threaded bit
            translate([0, 0, weapon_mount_screw_ch-0.5])
            cylinder(d=weapon_mount_screw_cd1, h=interior_lid_thickness-weapon_mount_screw_ch+1);

            // countersunk head
            cylinder(
                d1=weapon_mount_screw_cd2,
                d2=weapon_mount_screw_cd1,
                h=weapon_mount_screw_ch
            );
        }
    }

    // axle hole
    translate([0,0,interior_lid_thickness-(interior_lid_thickness*weapon_axle_hole_h)])
    cylinder(d=weapon_axle_hole_d, h=(interior_lid_thickness*weapon_axle_hole_h)+0.5);

    }
}

/*
 * Interior walls around the spinner area on the bottom lid
 */
module interior_weapon_walls() {
        
        intersection() {
            translate(weapon_offset)
            translate([0, base_d/2, interior_lid_thickness]) {
                difference() {

                    // outer wall
                    cylinder(
                        d=weapon_diameter + weapon_diameter_padding + weapon_wall_gap + (weapon_wall_thickness*2), 
                        h=base_h - (interior_lid_thickness*2)
                    );

                    // inner wall
                    translate([0, 0, -0.5])
                    cylinder(
                        d=weapon_diameter + weapon_diameter_padding + weapon_wall_gap, 
                        h=base_h - (interior_lid_thickness*2) + 1
                    );

                    // hole for weapon motor wires
                    if (interior_weapon_wall_hole) {
                        rotate([0, 0, interior_weapon_wall_hole_a])
                        translate([(weapon_diameter + weapon_diameter_padding + weapon_wall_gap)/2-interior_weapon_wall_hole_d, 0, 0])
                        rotate([0,90, 0])
                        cylinder(d=interior_weapon_wall_hole_d, h=interior_weapon_wall_hole_d*2);
                    }
                }
            }

            chassis_interior(base_w, weapon_w, body_w, plough_w, base_d, base_h + 1, interior_wall_thickness + interior_shelf_thickness + interior_padding_against_shelf);
            // chassis_interior(base_w, weapon_w, body_w, plough_w, base_d, base_h + 1, interior_wall_thickness);
        }
}

/*
 * Mock LiPo battery
 */
module interior_lipo() {
    translate(lipo_offset)
    translate([0, 0, interior_lid_thickness])
    cube(lipo_size);
}


/*
 * Power switch
 */
module interior_switch() {

    translate([
        interior_power_switch_x, 
        interior_wall_thickness+interior_shelf_thickness, 
        (base_h/2)+interior_power_switch_z_offset])
    rotate([90, 90, 0])
    import("imports/switch.stl");

}

///////////////////////////////////////////
//
//   Chassis Lids
//
///////////////////////////////////////////

// basic shape of each lid
module lid() {

    chassis_interior(base_w, weapon_w, body_w, plough_w, base_d, interior_lid_thickness, interior_wall_thickness + interior_lid_gap);
}

// the top lid shape
module lid_top() {
    lid_top_c = show_lid_colour ? "#F5A9B8" : undef; color(lid_top_c) {
        difference() {

            // lid with logo
            translate([0, 0, base_h - interior_lid_thickness]) {
                difference() {

                    // lid shape
                    lid();

                    // main decoration
                    sizes = qrs_logo_size();
                    iw = sizes[0]; id = sizes[1];
                    translate(lid_main_decoration_offset)
                    translate([
                        (base_w) / 2,(base_d) / 2,
                        interior_lid_thickness-lid_decoration_depth
                    ])
                    lid_main_decoration(lid_show_qrs_logo, 0, lid_show_whiskers);
                }
            }

            // wheels
            if (interior_show_wheels) interior_wheels();

            // screw holes
            if (interior_show_screw_holes) 
            translate([0, 0, base_h - interior_lid_mounting_hole_ch+0.0001]) 
            mounting_holes() 
            {
                // countersink
                cylinder(
                    d1=interior_lid_mounting_hole_cd1,
                    d2=interior_lid_mounting_hole_cd2,
                    h=interior_lid_mounting_hole_ch
                );

                // hole
                translate([0, 0, -interior_lid_mounting_hole_ch - 0.001])
                cylinder(
                    d=interior_lid_mounting_hole_cd1,
                    h=interior_lid_thickness
                );
            }
        }
    }
}

// the bottom lid shape
module lid_bottom() {
    lid_bottom_c = show_lid_colour ? "#5BCEFA" : undef; color(lid_bottom_c) {
        difference() {

            // lid shape
            lid();

            // main decoration
            translate(lid_main_decoration_offset)
            translate([
                        (base_w) / 2,(base_d) / 2,
                        -interior_lid_thickness+lid_decoration_depth
                    ])
            lid_main_decoration(lid_show_qrs_logo, 180, lid_show_whiskers);

            // wheels
            if (interior_show_wheels) interior_wheels();

            // screw holes
            if (interior_show_screw_holes) 
            translate([0, 0, 0]) 
            mounting_holes() 
            {
                // countersink
                cylinder(
                    d2=interior_lid_mounting_hole_cd1,
                    d1=interior_lid_mounting_hole_cd2,
                    h=interior_lid_mounting_hole_ch
                );

                // hole
                translate([0, 0, 0])
                cylinder(
                    d=interior_lid_mounting_hole_cd1,
                    h=interior_lid_thickness+1
                );
            }

            // weapon motor screw holes
            translate(weapon_offset)
            translate([0, base_d/2, 0]) 
            weapon_motor_screw_holes();

        }

        // make sure extra interior bits don't collide with shelf
        intersection() {
            union() {

                // wheel walls
                if (interior_show_wheel_walls) interior_wheel_walls();

                // spinner walls
                if (interior_show_weapon_walls) interior_weapon_walls();

                // gearbox mounting
                if (interior_show_gearbox_mounting) {

                    // tamiya double
                    if (interior_gearbox == "double") {
                        interior_gearbox_double_mounting();
                    }

                    // micro metal
                    else if (interior_gearbox == "micro") {
                        interior_gearbox_micro_mounting();
                    }

                    // no gearbox selected
                    else {}
                }

            }

            // interior shape    
            chassis_interior(base_w, weapon_w, body_w, plough_w, base_d, base_h-(interior_lid_thickness), interior_wall_thickness+interior_wall_gap);

            // chassis_shell();
        }
    }
}

///////////////////////////////////////////
//
//    TPU Shielding
//
///////////////////////////////////////////

// hey when you're doing this, offset the tpu shielding
// by [-thickness, -thickness, 0]
// this keeps the origin of the chassis shell at [0, 0, 0]

module tpu_shielding() {

    tpu_c = show_tpu_shielding_colour ? "#444444": undef;
    color(tpu_c) 
    difference() {
        translate([-tpu_thickness, -tpu_thickness, 0.01]) 
        {

            w_hole      = base_w;
            d_hole      = base_d;

            w_thickness = body_w + (tpu_thickness * 2);
            w_gap       = body_w + (tpu_gap * 2);
            d_thickness = base_d + (tpu_thickness * 2);
            d_gap       = base_d + (tpu_gap * 2);

            difference() 
            {
                // outer tpu shielding
                // scale([base_w_raw / base_w, base_d_raw / base_d, 1])
                // chassis_shape(base_w, weapon_w, body_w, plough_w, base_d, base_h);

                // create a chassis shape which is bigger than the main chassis by (tpu_thickness*2)
                chassis_shape(base_w, weapon_w, w_thickness, plough_w, d_thickness, base_d, base_h, po=[0, tpu_thickness, 0]);

                // subtract a similar shape which is only bigger by (tpu_gap*2)
                translate([(w_thickness - w_gap) / 2, (d_thickness - d_gap) / 2, -0.5])
                chassis_shape(base_w, weapon_w, w_gap, plough_w, d_gap, base_d, base_h + 1, po=[0, tpu_gap, 0]);

            }

        }

        // hole for the spinner
        if (tpu_show_weapon_hole) {
            interior_spinner();
        }
    }

}

///////////////////////////////////////////
//
//    Assembly
//
///////////////////////////////////////////

/*
 * This section takes all the defined modules and puts them together
 * for form the final bot chassis.
 */

if (show_main_chassis)  explode(180) chassis_shell();
if (show_top_lid)       explode(210) lid_top();
if (show_bottom_lid)    explode(0)   lid_bottom();
if (show_tpu_shielding) explode(120) tpu_shielding();

if (show_wheels)        explode(35) interior_wheels();
if (show_gearbox_axel)  explode(60) interior_gearbox_axel();
if (show_weapon)        explode(60) interior_spinner();
if (show_weapon_motor)  explode(30) interior_motor();

if (show_gearbox)       explode(35) {
    

    // tamiya double
    if (interior_gearbox == "double") {
        translate(wheel_offset)
        translate([base_w / 2, base_d/2, base_h/2])
        interior_gearbox_double();
    }

    // micro metal
    if (interior_gearbox == "micro") {
        translate(wheel_offset)
        translate([base_w / 2, base_d/2, base_h/2]) {
            translate([0, -(wheel_separation/2)+24.5, 0])
            rotate([0, 0, 180])
            interior_gearbox_micro();

            translate([0, (wheel_separation/2)-24.5, 0])
            interior_gearbox_micro();
        }
    }

    // no gearbox selected
    else {

    }
}

if (show_lipo)          explode(30) interior_lipo();
if (show_switch)        explode(30) interior_switch();