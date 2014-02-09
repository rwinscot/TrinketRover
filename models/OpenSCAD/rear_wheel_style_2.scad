include <dimensions.scad>;
use <front wheel.scad>;


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
	
translate([wheel_radius*2 + cog_height*2,0,0]){
	difference(){
		translate([0,0,wheel_width])
			rotate([0,180,0])
				front_wheel();
		translate([-25, -25,wheel_width - (wheel_width - cog_width)/2])
			cube([50,50,50]);		
	}
	difference(){
		intersection(){
			//scale([0.9,0.9,1]) 
			hornshape();
			cylinder(r= wheel_radius, h = wheel_width);
		}
	cylinder(r= hub_radius, h = wheel_width);
	}
}

module hornCutout(){
	translate([0, 0, servo_horn_arm_depth])
		hornshape();
		
	}





module hornshape(){
		hull(){
			translate([hornLength+hornWidth/2,0,0])
				cylinder(r=4.3/2, h = wheel_width-servo_horn_arm_depth-servo_horn_arm_thickness);
			translate([0, 0,0])
				cylinder(r=hornWidth/2, h = wheel_width- servo_horn_arm_depth-servo_horn_arm_thickness);		
			translate([-(hornLength+hornWidth/2),0,0])
				cylinder(r=4.3/2, h = wheel_width-servo_horn_arm_depth-servo_horn_arm_thickness);				
		}

}