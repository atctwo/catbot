# Bill Of Materials
This page lists all the parts needed to build a Cat Bot.  This is a list of all the stuff I used to build it, but a lot of it could easily be swapped out with other similar parts.  If you're using parts with different dimensions, it might be necessary to modify cat_bot.scad before printing.

| Item                        | Qty | Description and Notes                      |
|-----------------------------|-----|--------------------------------------------|
| **3D Printed Parts**        |     |                                            |
| Chassis                     | 1   | Ideally printed in TPU                     |
| Top Lid                     | 1   | Ideally TPU, but PLA would probably work   |
| Bottom Lid                  | 1   | Ideally TPU, but PLA would probably work   |
| **Motors and Wheels**       |     |                                            |
| Micro Metal Gearbox Motor   | 2   | 298:1 ratio is recommended                 |
| Micro Metal Bracket         | 2   | Separate model in this repo ([source](micro_metal_bracket.scad), [STL](renders/wheels/micro_metal_bracket.stl))|
| Micro Metal Shim            | 2   | Little shims made by [Pimoroni](https://shop.pimoroni.com/products/motor-shim-pack-of-5?variant=24169581255) so you don't have to solder directly to the motors |
| Wheels                      | 2   | The bot is designed to use any 42mm diameter, 3mm shaft wheels.  However, this cat has custom wheels if you want to make them! |
| &nbsp;&nbsp;&nbsp;&nbsp;Cat Wheel Hub | 2   | Main hub of the wheels, printed in TPU ([source](cat_wheel.scad), [STL](./renders/wheels/cat_wheel_v2_hub_36mm.stl)) |
| &nbsp;&nbsp;&nbsp;&nbsp;Cat Wheel Axel | 2   | 3mm shaft compatible insert, inserted into hub ([source](cat_wheel.scad), [STL](./renders/wheels/cat_wheel_v2_insert.stl)) |
| &nbsp;&nbsp;&nbsp;&nbsp;Grippy stuff |     | Rubbery grippy stuff used as treads for the wheels, kinda like [this](https://www.amazon.co.uk/LR-Supplies-Dashboard-Flexible-Rubber/dp/B08HM9TX5Y) |
| **Weapon**                  |     |                                            |
| 60mm spinning blade         | 1   | Currently using [this one](https://www.ull-robotics.com/shop/p/60mm-dia-disc) from ULL Robotics<br>Previously used [this one](https://monsoonrobotics.co.uk/collections/bars-and-discs) from Monsoon Robotics|
| Brushless Motor             | 1   | I'm currently using a BE1806 ([eg: this one from Bristol Bot Builders](https://shop.bristolbotbuilders.com/product/brushlessmotor/))|
| **Electronics**             |     |                                            |
| Electronic Speed Controller | 1   | I used [this dual ESC](https://shop.bristolbotbuilders.com/product/bbbv3/) from BBB to drive both wheels |
| ESC for the weapon          | 1   | Currently using a [Favorite Little Bee Spring 20A](https://www.ull-robotics.com/shop/p/m89iboau1osvfcs04i9ip4hepujcb5)<br>Previously used [this weapon ESC](https://shop.bristolbotbuilders.com/product/brushless/) from BBB |
| Receiver                    | 1   | Often RC receivers are used like [this one from BBB](https://shop.bristolbotbuilders.com/product/flysky/) (but my cat uses an [ESP32](https://www.adafruit.com/product/5395) and [some funky Bluetooth controller firmware I made](https://github.com/atctwo/bbrx)) |
| Power switch                | 1   | The one cat bot is designed for is [this one from BBB](https://shop.bristolbotbuilders.com/product/switch/) |
| Battery                     | 1   | I used a 300 mAh LiPo because its what I had on hand, but keep in mind: <ul><li>make sure yours will fit in the chassis</li><li>make sure it can source enough current to power all the motors</li></ul> |
| **Screws**                  |     |                                            |
| M3x7 (pan)                  | 8   | Mounting screws motor brackets             |
| M3x10 (countersunk)         | 8   | Mounting screws for lids; at least 10mm long |
| M2x6 (countersunk)          | 4   | Mounting screws for the weapon motor       |
| M2x8 (countersunk)          | 2   | Fixing the edge of the bottom lid to the chassis |
| M2x8 (pan)                  | 4   | Screws to mount the weapon onto the motor (use wider / thicker heads to avoid the force of the weapon bending them)  |
| M2.5x4                      | 2   | Mounting the power switch to the chassis   |
| **Inserts**                 |     |                                            |
| M3x4                        | 8   | Mounts for motor brackets                  |
| M3x4 again                  | 8   | Mounts for lid                             |
| M2x3                        | 2   | Extra support mounts for the bottom lid around the motor |
| M2.5x3                      | 2   | Mounts for the power switch                |