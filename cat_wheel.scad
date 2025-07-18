/*
 * Cat Bot Wheels
 * made by alex (atctwo) in july 2025
 * no idea how well these will work so i guess we'll see!
 * please print in something squishy and grippy (eg: TPU)
 *
 */

coating_t = 3;
wheel_d = 42 - (coating_t * 2);
wheel_h = 18;
wheel_ot = 5;
wheel_id = 15;
n_spokes = 5;
spoke_t = 5;
shaft_d = 3;
shaft_flat_offset = 0.75;

$fn = 200;


color("#222222") {
    difference() {

        union() {
        // outer bit
        difference() {
            
            // outer cylinder
            cylinder(d=wheel_d, h=wheel_h);

            // inner hollow
            translate([0, 0, -0.5])
            cylinder(d=wheel_d-(wheel_ot*2), h=wheel_h+1);
        }

        // spokes
        for (i=[0:n_spokes]) {
            rotate([0, 0, i*(360/n_spokes)])
            translate([-spoke_t/2, 0, 0])
            cube([spoke_t, (wheel_d/2)-(wheel_ot/2), wheel_h]);
        }

        // inner bit
        difference() {
            cylinder(d=wheel_id, h=wheel_h);
        }

    }

        // d-shaft
        translate([0, 0, -0.5])
        difference() {
            cylinder(d = shaft_d, h=wheel_h+1);
            translate([shaft_flat_offset, -(shaft_d/2), 0])
            cube([1.5, 3, wheel_h+1]);
        }
    }
}
    
