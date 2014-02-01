include <dimensions.scad>;
$fn = 100;
front_wheel();


module front_wheel(){
difference(){
solid_shape();
translate ([0,0,hub_depth]) 
		cylinder(r= hub_radius, h = wheel_width - hub_depth + .1);
cylinder(r= m3_screw_rad, h = wheel_width);
}
}

module solid_shape(){
	cylinder (r= wheel_radius, h= wheel_width); 
		for (i= [0: cog_number]){
			rotate([0,0,i*360/cog_number])
				translate ([-tooth_width/2,0,(wheel_width - cog_width)/2])
					tooth();
		}
}

module tooth(){
	hull(){
	#cube ([tooth_width, wheel_radius+ cog_height/2, cog_width]);
	translate([tooth_width/2,wheel_radius + cog_height, 0])
		#cylinder(r=tooth_width/3,h = cog_width);
	}
}
