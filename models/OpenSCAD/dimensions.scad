//*** Base Dimensions ***

base_length 		= 80.80 + 15 ; 
base_height			=  3.00	;
base_width 			= 65.55 ;
base_cout_radius	= 10.00	;

servo_width 		= 12.00 ;
servo_height		= 22.50 ; 
servo_length		= 23.00	;
servo_shoulder_d	=  2.30	;
servo_lug_length	=  5.00 ;
servo_lug_depth		=  2.30 ;
servo_lug_offset_F	= 16.00 ; 
servo_height_C		= 26.00 ;

servo_horn_hub_depth	= 4.5 ;
servo_horn_hub_radius	= 3.88 ; 
servo_horn_arm_depth	= 2.4 ;
servo_horn_arm_thickness = 1.5;
 
axel_radius 		=  4.00	;
axel_support_length = 15.00 ;
axel_hole_r			=  1.15	;

mount_r				= 10.00	;
mount_hole_r		=  1.25	;
mount_height		=  3.50	;
nut_trap_r			=  6.54/2	;  




// *** Wheel Dimensions ***
wheel_width			= 18.00	;
hub_radius			=  4.20	;
hub_depth			=  2.00	;
cog_number			=  6	;
cog_width			=  6.00	;
cog_height			=  3.40	;
tooth_width			=  4.00	;
tooth_gap			=  6.00 ;
m3_screw_rad		=  1.15	;



// *** Calculated Dimensions ***
// *** Do not touch unless you mean it ***.

servo_holder_width	= servo_length + servo_lug_length * 2 ;
servo_holder_thickness = servo_lug_length	;

wheel_radius = (cog_number*(tooth_width + tooth_gap))/(2*3.14);
echo("Wheel Diameter: ",wheel_radius*2);

//axel_ext			= 25.88 ; 
axel_ext			= (wheel_width-hub_depth)-(servo_lug_offset_F+servo_lug_depth-servo_height_C)+.5;
echo("Axel Extension: ",axel_ext);
axel_height 		=  base_height + servo_width/2	;

