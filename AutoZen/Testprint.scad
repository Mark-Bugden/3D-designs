

axel_to_screw_centerline_dist = 8;
screwhole_to_screwhole_dist = 35;
axel_plug_r = 5;
axel_base_r = 5/2;
axel_tip_w = 3;
hidden_base_h = 20;

m3_head_r = 5/2;
m3_head_h = 1.5;
m3_body_r = 3/2;
m3_washer_r = 3;
m3_washer_h = 1;

edge_thickness = 8;

total_height = 40;
total_radius = 100;

main_base_thickness = 3;

difference(){
//Main base
cylinder(h=main_base_thickness, r=30, $fn=100);
    



//The axel hole, for the motor
cylinder(h=50, r=axel_plug_r, $fn=100);


//The screw holes to mount the motor
//Screw hole left (from above)

//M3 screw hole (head)
translate([axel_to_screw_centerline_dist, screwhole_to_screwhole_dist/2,  main_base_thickness - m3_head_h]){
cylinder(h=10, r=m3_head_r, $fn=100);
}
//M3 screw hole (body)
translate([axel_to_screw_centerline_dist, screwhole_to_screwhole_dist/2, 0]){
cylinder(h=100, r=m3_body_r, $fn=100);
}


//Screw hole right (from above)

//M3 screw hole (head)
translate([axel_to_screw_centerline_dist, -screwhole_to_screwhole_dist/2,  main_base_thickness - m3_head_h]){
cylinder(h=10, r=m3_head_r, $fn=100);
}
//M3 screw hole (body)
translate([axel_to_screw_centerline_dist, -screwhole_to_screwhole_dist/2, 0]){
cylinder(h=100, r=m3_body_r, $fn=100);
}


}