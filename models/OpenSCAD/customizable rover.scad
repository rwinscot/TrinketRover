base_length 		= 80.80 + 15 ; 
base_height			=  3.00	;
base_width 			= 65.55 ;
servo_width 		= 23.00 ;
servo_height		= 12.00 ; 
servo_shoulder_d	=  3.00	;
axel_radius 		=  4.00	;
axel_support_length = 15.00 ;
axel_hole_r			=  1.15	;
axel_ext			= 20.88 ; 
mount_r				= 10.00	;
mount_hole_r		=  1.25	;
mount_height		=  3.50	;
nut_trap_r			=  6.54/2	;  
axel_height 		=  9.3	;
servo_holder_width	= servo_width + 10 ;

// *** Begin ****
difference(){
	union(){	
		translate ([base_width/2, 3.18 ,0 ]) mount();
		difference(){
			union(){

				base();
			}
			servo_cout();
			middle_cout();

		}
	}
	translate ([base_width/2, 3.18 ,0 ]) mount_cout();
}


// *** Cutouts ***

module servo_cout(){
	translate([0,base_length + 5 - servo_holder_width,base_height]) 
		cube ([base_width, servo_width, servo_height]);
}

module middle_cout(){
	translate([0,-1, base_height + 14])
		rotate([270,0,0])
			hull(){
				translate ([14 + 10, 0,0])
					cylinder (r=14, h= base_length + 2, $fn = 100);
				translate ([base_width - 14 - 10,0,0]) 
					cylinder (r=14, h= base_length + 2, $fn = 100);
			}	
}

module mount_cout (){
	cylinder (r= mount_hole_r, mount_height + 2);
	translate ([0,0,base_height-2])
		cylinder (r= nut_trap_r,  h = 3, $fn = 6);
}

// *** Base ***
module base (){
	cube ([base_width, base_length, base_height]);
	translate([servo_shoulder_d,base_length - servo_holder_width,0]) 
		cube([base_width - 2 * servo_shoulder_d, servo_holder_width, servo_height]);

	axel(); 
}

module mount (){
	cylinder (r= mount_r, h = mount_height);
}



module axel (){
	hull(){
		translate([0,axel_radius,axel_height])
			rotate ([0,90,0]) 
				cylinder (r=axel_radius, h= base_width, $fn= 40);
		cube ([base_width, axel_support_length, base_height]);
	}
	difference(){
		hull(){
			translate([-axel_ext,axel_radius,axel_height])
				rotate ([0,90,0]) 
					cylinder (r=axel_radius, h= base_width + 2 * axel_ext, $fn = 40);
		}
		translate([-axel_ext - 1 ,axel_radius,axel_height])
			rotate ([0,90,0]) 
				cylinder (r=axel_hole_r, h= base_width + (2 * axel_ext) + 2, $fn = 30);
	}
}
