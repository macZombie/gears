$fn = 64;



pitch = 0.5;
   

module bearingA(){


    translate([0,0,0])cylinder(4,5,5);





}


module bearing(){

    difference(){
    
        bearingA();
        
         translate([0,0,-0.01])cylinder(4.02,1.5,1.5);
    
    
    
    }



}


module gearA(teeth,width){


    circumf = pitch * teeth * 2;
    
    rad = circumf / PI;

    translate([0,0 , 0]) rotate([0,0,0]) scale([1,1,1]) cylinder(width,rad,rad);
    
    step = ( 360 / teeth ) ;
    
    
    
    
    for ( i = [  0 : step : 360 ] ){
    
        x = rad * cos(i);
    
        y = rad * sin(i);
    
        // translate([x,y,0]) cylinder(width,pitch,pitch);
           
        translate([x,y,0]) rotate([0,0,i]) scale([1.618,1,1]) cylinder(width,pitch,pitch);
    
    
    }

 




}

module gear(teeth,width){

    circumf = pitch * teeth * 2;
    
    rad = circumf / PI;
    
    step = ( 360 / teeth );
        
   



    difference(){
    
        gearA(teeth,width);
        
       

        step = ( 360 / teeth ) ;
    
    
    
    
        for ( i = [  step / 2  : step : 360 ] ){
    
            x = rad * cos(i);
    
            y = rad * sin(i);
    
            translate([x,y,-0.1]) cylinder(width + 0.2,pitch,pitch);
    
    
        }
        

        translate([0,0 , - 0.1])cylinder(width + 0.2,2.5,2.5);
    
    }







}



module ringA(rad,width){

    translate([0,0,0]) cylinder(width -1 ,rad,rad);




}


module ring(rad,width){

    difference(){
    
        ringA(rad,width);
        
        translate([0,0,-0.1]) rotate([0,0,-3.7]) gear(58,width + 0.2);
        
        translate([0,0,-0.1]) rotate([0,0,-3.7]) cylinder(width + 0.2, 20);
        
        
        }



}


module pin(){

    translate([0,0,0]) cylinder(8,2.4,2.4);
    
  



}



module inputA(){

    //color("#008000")translate([13.2,0,0]) pin();

    //color("#008000")translate([-13.2,0,0]) pin();

    //color("#008000")translate([0,13.2,0]) pin();
    
    d = 13.5;
    
    for ( i = [ 0 : 120 : 240 ] ){
    
        x = d * cos(i);
        
        y = d * sin(i);
    
        color("#008000")translate([x,y,0]) pin();
    
    }
    
    color("#008000")translate([0,0,0]) pin();
    
    
    color("#008000")translate([0,0,5.5]) cylinder(4,23,23);
    
    
    //color("#008000")translate([0,0,9]) cylinder(10,2.5,2.5);


}


module input(){

    difference(){
    
        inputA();
        
        
    }
    
    
}

/*
color("#ff8080")translate([0,0,-0.5]) rotate([0,0,-5.5]) gear(24,6);

color("#ff8080")translate([0,0,-4.5]) cylinder(4,23,23);
*/


/*
color("#008080")translate([13.2,0,0]) rotate([0,0,-3.7]) gear(16,4);

color("#008080")translate([-13.2,0,0]) rotate([0,0,-3.7]) gear(16,4);

color("#008080")translate([0,13.2,0]) rotate([0,0,-3.7]) gear(16,4);

color("#008080")translate([0,-13.2,0]) rotate([0,0,-3.7]) gear(16,4);

*/
//color("#000080") translate([0,0,0]) ring(24,6);


//input();


//bearing();

module centreWheel(){

    difference(){
    
        color("#800000") gear(32,4);
        
        scale([1,1,1.0001])bearing();
    
   
    }

    color("#808080" )bearing();


}



module sideWheel(){

    difference(){
    
        color("#008000") gear(24,4);
        
        scale([1,1,1.0001])bearing();
    
   
    }

    color("#808080" )bearing();


}


centreWheel();

translate([20,0,0]) sideWheel();
