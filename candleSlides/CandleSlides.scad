slidethick = .11;
slidewidth = 2;
slideheight = slidewidth;
r =  1.3764;
roffset = slidethick + r;
outerPent = 2;
platform_height = .5;
holes_z = platform_height - .25;
inner_margin = .125;
cylinder_r = 1.25;
scaling = 25.4;


scale([scaling, scaling, scaling]){
    difference(){
        linear_extrude(height = platform_height)
            rotate(90)
                circle(r = outerPent, $fn = 5);
        for(rotateamt = [0:72:360])
            rotate_about_pt(rotateamt,0,[0,0,0])
                translate([0,-r,holes_z + slideheight / 2 ])
                    cube([slidewidth, slidethick, slideheight], center=true);
        cylinder(h= 10, r=cylinder_r, center = true, $fn=360); 

    }
}




module rotate_about_pt(z, y, pt) {
    translate(pt)
        rotate([0, y, z]) // CHANGE HERE
            translate(-pt)
                children();   
}