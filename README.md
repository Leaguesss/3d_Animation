# 3d_Animation

Using processing to run this program. The processing file named as source_code


Requirements

* When you click mouseat(x,y) on your screen shoot a 3D ball with a random texture (randomly load a texture from your texture pool). The texture pool (several image files) should be included in canvas submission zip file.

* This ball flies away from the screen along the Z axis with a random direction according to the XY plane. It means this ball does not go straight ahead, but instead is shot away in a random direction. The gravity always effect the movement of this ball as long as it is in screen.

* While the ball moves away from the screen, it falls down to the ground due to the gravity.

* The space is constrained by 5 walls (left, right, ceiling, floor and a wall far ahead facing the screen). When the ball touches any of the wall, it bounces back and its new direction is computed considering its previous direction. The 6th wall (the wall where the camera is placed) is free to design (either bounce the ball back or make the ball disappear when the ball comes towards this wall).

* You can shoot new balls into the screen while the previous balls are travelling.
* The ball spins while it is travelling. The direction of spinning is determined by its original direction and the bounces.
* When the balls touch each other, they bounce back as well.
* The potential energy (speed and height) of the ball decays according to the travelling time as well as the number of bounces.
