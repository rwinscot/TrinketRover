include <dimensions.scad>;
use <front wheel.scad>;

reach = 40;
hornDiameter = 7.47;
hornWidth = 6.8;
hornThickness = 1.5;
wallThickness = 0.61*2;
hornLength  = 17.45 ;
thickness = 4;
switchWidth = 19.8;
switchHeight = 12;
holeHeight = 7.1 ; 
holeWidth = 3;
holeLength = 10;

lug_rad = 1.5;
$fn = 100;

difference(){
cylinder(r= wheel_radius, h = (wheel_width - cog_width)/2);
cylinder(r= servo_horn_hub_radius, h = (wheel_width - cog_width)/2);
hornCutout();
}

translate([0,+ servo_horn_hub_radius +(wheel_radius - servo_horn_hub_radius)/2,0])
	cylinder (r = lug_rad, h =  (wheel_width - cog_width)/2 + 4);
translate([0, -(servo_horn_hub_radius +(wheel_radius - servo_horn_hub_radius)/2),0])
	cylinder (r = lug_rad, h =  (wheel_width - cog_width)/2 + 4);
	
	
translate([wheel_radius*2 + cog_height*2,0,0])
	difference(){
		translate([0,0,-(wheel_width - cog_width)/2])
			front_wheel();
		translate([-25, -25, -50])
			cube([50,50,50]);

	translate([0,+ servo_horn_hub_radius +(wheel_radius - servo_horn_hub_radius)/2,0])
		cylinder (r = lug_rad+0.2, h =  6);
	translate([0, -(servo_horn_hub_radius +(wheel_radius - servo_horn_hub_radius)/2),0])
		cylinder (r = lug_rad+0.2, h =  6);
		
	}

module hornCutout(){
	translate([0, 0, thickness - hornThickness])
		hull(){
			translate([hornLength+hornWidth/2,0,0])
				cylinder(r=4.3/2, h = thickness);
			translate([0, 0,0])
				cylinder(r=hornWidth/2, h = thickness);		
			translate([-(hornLength+hornWidth/2),0,0])
				cylinder(r=4.3/2, h = thickness);				
		}
}



