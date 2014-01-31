
wheel_width		= 18.00	;
hub_radius		=  4.20	;
hub_depth		=  2.00	;
cog_number		=  5	;
cog_width		=  7.00	;
cog_height		=  2	;
tooth_width		=  4.00	;
m3_screw_rad	=  1.15	;

wheel_radius = (cog_number*(tooth_width +8))/(2*3.14);
echo(wheel_radius*2);

$fn = 100;
difference(){
solid_shape();
translate ([0,0,hub_depth]) 
		cylinder(r= hub_radius, h = wheel_width - hub_depth + .1);
cylinder(r= m3_screw_rad, h = wheel_width);
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
