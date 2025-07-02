# Bill Of Materials
This page lists all the parts needed to build a Cat Bot.  This is a list of all the stuff I used to build it, but a lot of it could easily be swapped out with other similar parts.  If you're using parts with different dimensions, it might be necessary to modify cat_bot.scad before printing.

# Common
| Item                        | Qty | Description and Notes                      |
|-----------------------------|-----|--------------------------------------------|
| **3D Printed Parts**        |     |                                            |
| Chassis                     | 1   | Ideally printed in PETG                    |
| Top Lid                     | 1   | Probably ok to print in PLA                |
| Bottom Lid                  | 1   | Probably ok to print in PLA                |
| TPU Shielding               | 1   | Printed in TPU                             |
| **Motors and Wheels**       |     |                                            |
| Micro Metal Gearbox Motor   | 2   | 298:1 ratio is recommended                 |
| Micro Metal Bracket         | 2   | Separate model in this repo ([source](micro_metal_bracket.scad), [STL](renders/micro_metal_bracket.stl))|
| Micro Metal Shim            | 2   | Little shims made by [Pimoroni](https://shop.pimoroni.com/products/motor-shim-pack-of-5?variant=24169581255) so you don't have to solder directly to the motors |
| 42mm wheel, 3mm D-shaft     | 2   | I used [these wheels](https://www.pololu.com/product/1090) from Polulu |
| **Weapon**                  |     |                                            |
| 60mm spinning blade         | 1   | For example, those sold by [Monsoon Robotics](https://monsoonrobotics.co.uk/collections/bars-and-discs)|
| Brushless Motor             | 1   | I used [this one from Bristol Bot Builders](https://shop.bristolbotbuilders.com/product/brushlessmotor/)|
| **Electronics**             |     |                                            |
| Electronic Speed Controller | 1   | I used [this dual ESC](https://shop.bristolbotbuilders.com/product/bbbv3/) from BBB to drive both wheels |
| ESC for the weapon          | 1   | I used [this weapon ESC](https://shop.bristolbotbuilders.com/product/brushless/) from BBB |
| Receiver                    | 1   | Often RC receivers are used like [this one from BBB](https://shop.bristolbotbuilders.com/product/flysky/) (but my cat uses an [ESP32](https://www.adafruit.com/product/5395) and [some funky Bluetooth controller firmware I made](https://github.com/atctwo/bbrx)) |
| Power switch                | 1   | The one cat bot is designed for is [this one from BBB](https://shop.bristolbotbuilders.com/product/switch/) |
| Battery                     | 1   | I used a 300 mAh LiPo because its what I had on hand, but make sure yours will fit in the chassis |
| **Screws**                  |     |                                            |
| M3x7 (pan)                  | 8   | Mounting screws motor brackets             |
| M3x10 (countersunk)         | 8   | Mounting screws for lids; at least 10mm long |
| M2x6 (countersunk)          | 4   | Mounting screws for the weapon motor       |
| M2x8 (pan)                  | 4   | Screws to mount the weapon onto the motor  |
| **Inserts**                 |     |                                            |
| M3x4                        | 8   | Mounts for motor brackets                  |
| M3x4 again                  | 8   | Mounts for lid                             |
