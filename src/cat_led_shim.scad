/*
 * Cat Bot LED Shim v1
 * made by alex (atctwo) in november 2025
 * 
 * this is a little dohickey to mount an LED into the side
 * of cat bot's chassis.  the idea is that the LED is held
 * in place without sticking out the side of the chassis.
 * this should be printed in some type of transparent filament
 * so that the light shines through
 *
 * Please consider printing with ??? infill and
 * a concentric top/bottom pattern to avoid interfering with
 * the light's output path
 *
 */

// diameter of the hole on the outside
do = 5;

// diameter of the hole on the inside
di = 8;

// amount by which the shim protrudes from the outside
pro = 0;

// amount by which the shim protrudes from the inside
pri = 1;

// amount by which the shim extends into the outside side
exo = 2;

// amount by which the shim extends into the inside side
exi = 1;

// diameter of the LED hole on the inside
dl = 5.1; // d=5.0±0.2mm, shelfy bit is 5.8±0.2mm

// depth of the LED hole on the inside
wl = 8.0; // 8.7±0.2mm incl shelfy bit

// led offset
ol = 3.5;

// depth of the chassis
wc = 4.75 + 2.5 + 2.5;

// resolution of curved faces
$fn = 100;


module led_hole() {
    sphere(d=dl);
    translate([0, 0, -(wl-(dl/2))])
    cylinder(d=dl, h=wl-(dl/2));
}

module cat_led_shim(show_led_hole=false) {

    difference() {
        union() {

            // base cylinder for the inside side
            translate([0, 0, -pri])
            cylinder(h=pri+exi, d=di);

            // base cylinder for the outside side
            translate([0, 0, wc-exo-(0.0001/2)])
            cylinder(h=pro+exo+0.0001, d=do);

            // da cone
            translate([0, 0, pri])
            cylinder(d1=di, d2=do, h=(wc-exo-exi));

        }

        // led hole
        if (show_led_hole) {
            translate([0, 0, ol])
            led_hole();
        }
    }

}

if (0)
difference() {
    union() {
        difference() {

            // mock chassis
            color("black")
            translate([-(di), -(di), 0])
            cube([di*2, di*2, wc]);

            // shim
            cat_led_shim();        
        }
    }
// the slicerrr
translate([-di*1.5, 0, -wc/2])
cube([di*3, di*2, wc*2]);
}

color("teal", 0.8)
cat_led_shim(true);