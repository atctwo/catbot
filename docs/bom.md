# Bill Of Materials
This page lists all the parts needed to build a Cat Bot.  This is a list of all the stuff I used to build it, but a lot of it could easily be swapped out with other similar parts.  If you're using parts with different dimensions, it might be necessary to modify cat_bot.scad before printing.

Items in *italics* are need to be 3D printed.  Please refer to the [build guide](./building.md) for more detail on how to print the 3D printed parts.

| Item                        | Qty | Description and Notes                      | STL render |
|-----------------------------|-----|--------------------------------------------|------------|
| **Main Chassis**            |     |                                            |            |
| *Chassis*                   | 1   | Ideally printed in TPU                     | [v1.3.2](../renders/little_cat/v1.3.2/main_chassis_v1.3.2a.stl) |
| *Top Lid (top)*             | 1   | Ideally TPU, but PLA would probably work   | [v1.3.2](../renders/little_cat/v1.3.2/top_lid_top_v1.3.2a.stl) |
| *Top Lid (bottom)*          | 1   | Printed with PLA                           | [v1.3.2](../renders/little_cat/v1.3.2/top_lid_bottom_v1.3.2a.stl) |
| *Bottom Lid*                | 1   | Ideally TPU, but PLA would probably work   | [v1.3.2](../renders/little_cat/v1.3.2/bottom_lid_v1.3.2a.stl) |
| **Motors and Wheels**       |     |                                            | |
| Micro Metal (N20) Gearbox Motor   | 2   | 298:1 ratio is recommended                 | |
| *Micro Metal Bracket*       | 2   | Printed with PLA or PETG                   | [v2](../renders/wheels/micro_metal_bracket_v2.stl) |
| Micro Metal Shim            | 2   | Little shims made by [Pimoroni](https://shop.pimoroni.com/products/motor-shim-pack-of-5?variant=24169581255) so you don't have to solder directly to the motors | |
| Wheels                      | 2   | The bot is designed to use any 42mm diameter, 3mm shaft wheels.  However, this cat has custom wheels if you want to make them! |
| <em>&nbsp;&nbsp;&nbsp;&nbsp;Cat Wheel Hub</em> | 2   | Main hub of the wheels, printed in TPU | [v3](../renders/wheels/cat_wheel_v3.0_hub.stl) |
| <em>&nbsp;&nbsp;&nbsp;&nbsp;Cat Wheel Axel Insert</em> | 2   | 3mm shaft compatible insert, inserted into hub ([source](cat_wheel.scad), [STL](./renders/wheels/cat_wheel_v2_insert.stl)) | [v3](../renders/wheels/cat_wheel_v3.0_insert.stl) |
| <em>&nbsp;&nbsp;&nbsp;&nbsp;Cat Wheel Tyre</eM> |     | Tyres for the wheels, cast out of silicone (again, pls refer to the build guide for more info!) | [v3](../renders/wheels/cat_wheel_v3.0_tyre.stl) |
| **Weapon**                  |     |                                            | |
| 60mm spinning blade         | 1   | Currently using [this one](https://www.ull-robotics.com/shop/p/60mm-dia-disc) from ULL Robotics<br>Previously used [this one](https://monsoonrobotics.co.uk/collections/bars-and-discs) from Monsoon Robotics| |
| Brushless Motor             | 1   | I'm currently using a BE1806 ([eg: this one from Bristol Bot Builders](https://shop.bristolbotbuilders.com/product/brushlessmotor/))| |
| **Electronics**             |     |                                            | |
| Electronic Speed Controller | 1   | I used [this dual ESC](https://shop.bristolbotbuilders.com/product/bbbv3/) from BBB to drive both wheels | |
| ESC for the weapon          | 1   | Currently using a [Favorite Little Bee Spring 20A](https://www.ull-robotics.com/shop/p/m89iboau1osvfcs04i9ip4hepujcb5)<br>Previously used [this weapon ESC](https://shop.bristolbotbuilders.com/product/brushless/) from BBB | |
| Receiver                    | 1   | Often RC receivers are used like [this one from BBB](https://shop.bristolbotbuilders.com/product/flysky/) (but my cat uses an [ESP32](https://www.adafruit.com/product/5395) and [some funky Bluetooth controller firmware I made](https://github.com/atctwo/bbrx)) | |
| Power switch                | 1   | The one cat bot is designed for is [this one from BBB](https://shop.bristolbotbuilders.com/product/switch/) | |
| Battery                     | 1   | I used a 300 mAh LiPo because its what I had on hand, but keep in mind: <ul><li>make sure yours will fit in the chassis</li><li>make sure it can source enough current to power all the motors</li></ul> | |
| Battery connectors          | 2P  | Need at least one for the battery.  I have one on both sides of the power switch so I can remove the switch assembly from the rest of the bot.  The type and gender of connectors you need will depend on what connector your battery has |
| Power LED                   | 1   | Any old 5mm LED and a current limiting resistor (although my builds use a [5mm WS2812B](https://www.sparkfun.com/led-rgb-addressable-pth-5mm-clear-5-pack.html) so the ESP32 can use it as a status LED too) |
| *Power LED shim*            | 1   | A little thingy to hold the LED into a hole in the chassis.  Printed in transparent PLA | [v1](../renders/cat_led_shim.stl) |
| **Screws**                  |     |                                            | |
| M3x7 (pan)                  | 8   | Mounting screws motor brackets             | |
| M3x10 (countersunk)         | 8   | Mounting screws for lids; at least 10mm long | |
| M2x6 (countersunk)          | 4   | Mounting screws for the weapon motor       | |
| M2x8 (countersunk)          | 2   | Fixing the edge of the bottom lid to the chassis | |
| M2x6 (pan)                  | 4   | Screws to mount the weapon onto the motor (use wider / thicker heads to avoid the force of the weapon bending them)  | |
| M2.5x4                      | 2   | Mounting the power switch to the chassis   | |
| **Inserts**                 |     |                                            | |
| M3x4                        | 8   | Mounts for motor brackets                  | |
| M3x4 again                  | 8   | Mounts for lid                             | |
| M2x3                        | 2   | Extra support mounts for the bottom lid around the motor | |
| M2.5x3                      | 2   | Mounts for the power switch                | |