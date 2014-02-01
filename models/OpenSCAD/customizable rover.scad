include <dimensions.scad>;
use <front wheel.scad>;

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
	translate([0,base_length + servo_holder_thickness - servo_holder_width,base_height])
		dummy_servo();
	translate([-(axel_ext + hub_depth),axel_radius,axel_height])
	rotate([0,90,0])
	#front_wheel();

// *** Cutouts ***

module servo_cout(){
	translate([0,base_length + servo_holder_thickness - servo_holder_width,base_height]) 
		cube ([base_width, servo_length, servo_width]);

}

module middle_cout(){
	translate([0,-1, base_height + base_cout_radius])
		rotate([270,0,0])
			hull(){
				translate ([base_cout_radius + 10, 0,0])
					cylinder (r=base_cout_radius, h= base_length + 2, $fn = 100);
				translate ([base_width - base_cout_radius - 10,0,0]) 
					cylinder (r=base_cout_radius, h= base_length + 2, $fn = 100);
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
		cube([base_width - 2 * servo_shoulder_d, servo_holder_width, servo_width]);

	axel(); 
}

module mount (){
	cylinder (r= mount_r, h = mount_height);
}

module dummy_servo(){
	translate([servo_lug_offset_F+servo_lug_depth-servo_height,0,0])
		#cube ([servo_height, servo_length, servo_width]);	
	translate([0,-servo_lug_length,0])
		cube([servo_lug_depth, servo_lug_length*2 + servo_length, servo_width]);
	translate([servo_lug_offset_F+servo_lug_depth,servo_length - servo_width/2,servo_width/2])
		rotate([0,270,0])
			cylinder(r=servo_width/2, h=servo_height_C);
}

module axel (){
	difference(){
		union(){
			hull(){
				translate([0,axel_radius,axel_height])
					rotate ([0,90,0]) 
						cylinder (r=axel_radius, h= base_width, $fn= 40);
				cube ([base_width, axel_support_length, base_height]);
			}
			translate([-axel_ext,axel_radius,axel_height])
				rotate ([0,90,0]) 
					cylinder (r=axel_radius, h= base_width + 2 * axel_ext, $fn = 40);
		}
		// The hole for axis mounting screws
		translate([-axel_ext - 1 ,axel_radius,axel_height])
			rotate ([0,90,0]) 
				cylinder (r=axel_hole_r, h= base_width + (2 * axel_ext) + 2, $fn = 30);
	}

}
