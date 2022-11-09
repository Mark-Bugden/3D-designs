top_baseplate_length = 38.5;
top_baseplate_width = 38;
height = 5;

box_width = 50;
box_length = 50;
box_height = 30;

cable_width = 14;

lens_length = 20;
lens_width = 20;
lens_height = 7.3;
lens_small_circle_radius = 3;
iris_rad_small = 6;
iris_rad_big = 7;
iris_height = 2;

bulk_width = 43;
bulk_length = 43;
bulk_height = 15;

mount_holes_radius = 2;
mount_holes_x_sep = 26.2 + 2*mount_holes_radius;
mount_holes_y_sep = 26.2 + 2*mount_holes_radius;

insert_height = 20;
insert_radius = 1.8;

fan_screw_offset = 3.1;
fan_hole_offset_top = 5;
fan_hole_offset_side = 10;

screw_radius = 1.8;
screw_height = lens_height+iris_height+1;
screw_top_radius = 2.2;



box_wall = (box_width-bulk_width)/2;

rotate([180,0,0])

difference()
{
// Lid
#cube([50,50,3.5]);


// Cable hole
translate([25-7.5,6,0])
{
cube([15,9,10]);
}

//Threaded lid insert1
translate([box_wall/1.6, box_wall/1.6,-1])
{
    cylinder(r=insert_radius,h=insert_height+1, $fn=30);
}
translate([box_wall/1.6, box_wall/1.6,0])
{
cylinder(r=2.2, h=1, $fn=30);
}
//Threaded lid insert2
translate([box_width - box_wall/1.6, box_wall/1.6,-1])
{
    cylinder(r=insert_radius,h=insert_height+1, $fn=30);
}
translate([box_width - box_wall/1.6, box_wall/1.6,0])
{
cylinder(r=2.2, h=1, $fn=30);
}

//Threaded lid insert3
translate([box_wall/1.6, box_width-box_wall/1.6,-1])
{
    cylinder(r=insert_radius,h=insert_height+1, $fn=30);
}

translate([box_wall/1.6, box_width-box_wall/1.6,0])
{
cylinder(r=2.2, h=1, $fn=30);
}



//Threaded lid insert4
translate([box_width-box_wall/1.6, box_width-box_wall/1.6,-1])
{
    cylinder(r=insert_radius,h=insert_height+1, $fn=30);
}
translate([box_width-box_wall/1.6, box_width-box_wall/1.6,0])
{
cylinder(r=2.2, h=1, $fn=30);
}


}