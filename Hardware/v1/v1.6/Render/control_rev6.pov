//POVRay-File created by 3d41.ulp v1.05
///Users/georgehadley/Documents/NBitWonder/Projects/RGBSaber/Hardware/v1/v1.6/RGBSaber_Control/control_rev6.brd
//12/8/10 1:01 AM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare Environment = on;

#local cam_x = 0;
#local cam_y = 203;
#local cam_z = -61;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -2;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 15;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 24;
#local lgt1_pos_y = 36;
#local lgt1_pos_z = 14;
#local lgt1_intense = 0.724212;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 36;
#local lgt2_pos_z = 14;
#local lgt2_intense = 0.724212;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 36;
#local lgt3_pos_z = -9;
#local lgt3_intense = 0.724212;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 36;
#local lgt4_pos_z = -9;
#local lgt4_intense = 0.724212;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 63.551000;
#declare pcb_y_size = 26.668500;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(901);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(Environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-31.775500,0,-13.334250>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro CONTROL_REV6(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
//Board
box{<63.551000,0,26.667500><0.000000,-1.500000,-0.001000> texture{col_brd}}

//Holes(real)/Parts
cylinder{<2.285500,1,2.540000><2.285500,-5,2.540000>1.651000 texture{col_hls}}
cylinder{<2.288000,1,24.130000><2.288000,-5,24.130000>1.651000 texture{col_hls}}
cylinder{<60.960000,1,24.130000><60.960000,-5,24.130000>1.651000 texture{col_hls}}
cylinder{<60.960000,1,2.540000><60.960000,-5,2.540000>1.651000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_BATT) #declare global_pack_BATT=yes; object {PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<5.889000,0.000000,23.485000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) BATT  1X02
#ifndef(pack_BLUE) #declare global_pack_BLUE=yes; object {IC_SMD_SOT223("FZTA14V1","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.276000,0.000000,5.588000>translate<0,0.035000,0> }#end		//SOT223 BLUE FZTA14V1 SOT223
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_WIMA_5_072_072_130("100uf",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.456500,0.000000,22.428500>}#end		//WIMA-Capacitor Grid 5.08 (capacitator-wima.lib) C1 100uf C5B7.2
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.370000,0.000000,8.636000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 .01uF 0805
#ifndef(pack_GREEN) #declare global_pack_GREEN=yes; object {IC_SMD_SOT223("FZTA14V1","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.276000,0.000000,13.208000>translate<0,0.035000,0> }#end		//SOT223 GREEN FZTA14V1 SOT223
#ifndef(pack_LUX) #declare global_pack_LUX=yes; object {PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<61.183000,0.000000,17.199000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) LUX  1X04
#ifndef(pack_PERIPH) #declare global_pack_PERIPH=yes; object {PH_1X9()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.072000,0.000000,1.821500>}#end		//Header 2,54mm Grid 9Pin 1Row (jumper.lib) PERIPH M09 1X09
#ifndef(pack_PRG) #declare global_pack_PRG=yes; object {PH_1X5()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<3.045500,0.000000,18.081000>}#end		//Header 2,54mm Grid 5Pin 1Row (jumper.lib) PRG  1X05
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("662",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.259000,0.000000,18.161000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 6.65K M0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.259000,0.000000,15.367000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 3.3K M0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.259000,0.000000,12.573000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R3 3.3K M0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<18.542000,-1.500000,5.969000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R4 10K M0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<18.542000,-1.500000,9.144000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R5 10K M0805
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0805("251",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<18.494000,-1.500000,14.999000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R6 250 M0805
#ifndef(pack_RED) #declare global_pack_RED=yes; object {IC_SMD_SOT223("FZTA14V1","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.276000,0.000000,20.701000>translate<0,0.035000,0> }#end		//SOT223 RED FZTA14V1 SOT223
#ifndef(pack_SOIC1) #declare global_pack_SOIC1=yes; object {IC_SMD_SSOP28("P18F2221SSOP","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<31.750000,0.000000,11.430000>translate<0,0.035000,0> }#end		//SSOP28 SOIC1 P18F2221SSOP SSOP-28
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BATT) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<5.889000,0,23.485000> texture{col_thl}}
#ifndef(global_pack_BATT) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<5.889000,0,20.945000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,7.888000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.736000,0.000000,5.588000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,3.288000>}
object{TOOLS_PCB_SMD(1.850000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.816000,0.000000,5.588000>}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<26.996500,0,22.428500> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<21.916500,0,22.428500> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<39.370000,0.000000,9.536000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<39.370000,0.000000,7.736000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,15.508000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.736000,0.000000,13.208000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,10.908000>}
object{TOOLS_PCB_SMD(1.850000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.816000,0.000000,13.208000>}
#ifndef(global_pack_LUX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<61.183000,0,17.199000> texture{col_thl}}
#ifndef(global_pack_LUX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<61.183000,0,14.659000> texture{col_thl}}
#ifndef(global_pack_LUX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<61.183000,0,12.119000> texture{col_thl}}
#ifndef(global_pack_LUX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<61.183000,0,9.579000> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<19.072000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<21.612000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<24.152000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<26.692000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<29.232000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<31.772000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<34.312000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<36.852000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<39.392000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,18.081000> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,15.541000> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,13.001000> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,10.461000> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,7.921000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.309000,0.000000,18.161000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.209000,0.000000,18.161000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.309000,0.000000,15.367000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.209000,0.000000,15.367000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.309000,0.000000,12.573000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.209000,0.000000,12.573000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.592000,-1.537000,5.969000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.492000,-1.537000,5.969000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.592000,-1.537000,9.144000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.492000,-1.537000,9.144000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.544000,-1.537000,14.999000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.444000,-1.537000,14.999000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,23.001000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.736000,0.000000,20.701000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,18.401000>}
object{TOOLS_PCB_SMD(1.850000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.816000,0.000000,20.701000>}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<10.682500,0,20.275500> texture{col_thl}}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<12.482500,0,20.275500> texture{col_thl}}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<14.282500,0,20.275500> texture{col_thl}}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.082500,0,20.275500> texture{col_thl}}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.882500,0,20.275500> texture{col_thl}}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,15.655000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,15.005000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,14.355000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,13.705000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,13.055000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,12.405000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,11.755000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,11.105000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,10.455000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,9.805000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,9.155000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,8.505000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,7.855000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,7.205000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,7.205000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,7.855000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,8.505000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,9.155000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,9.805000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,10.455000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,11.105000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,11.755000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,12.405000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,13.055000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,13.705000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,14.355000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,15.005000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,15.655000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.914400,0.508000,1,16,1,0) translate<33.528000,0,12.446000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<22.863500,0,16.484500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.914400,0.508000,1,16,1,0) translate<30.480000,0,10.795000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<22.078000,0,6.980500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<24.183000,0,7.854500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<30.899000,0,14.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<31.057000,0,15.685000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<26.163500,0,11.077000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.914400,0.508000,1,16,1,0) translate<30.504000,0,12.706000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.914400,0.508000,1,16,1,0) translate<32.385000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.530000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.260000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.881000,0,14.646500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.874000,0,13.433000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.602500,0,21.962500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.820000,0,21.962000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.820000,0,20.798000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.628500,0,19.633500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.820000,0,19.633000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<53.340000,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,20.320000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,20.320000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<50.800000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.743500,0,14.669000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.721500,0,13.442500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.743000,0,12.150000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.859500,0,12.111500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<52.070000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<53.340000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,6.350000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,5.080000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,6.350000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<53.340000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<53.340000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<52.070000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<50.800000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.530000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.260000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.595500,0,6.826500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.789500,0,6.811000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.789000,0,5.663000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.595500,0,5.663500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.595500,0,4.485000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.789500,0,4.484500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<15.240000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.820000,0,20.798000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.596000,0,20.782500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<15.234000,0,5.926000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,16.510000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,90.000000,0> translate<1.270000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,-1.535000,18.034000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<1.270000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.045500,-1.535000,18.081000>}
box{<0,0,-0.152400><0.255854,0.035000,0.152400> rotate<0,-10.584565,0> translate<2.794000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.045500,-1.535000,13.001000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.305500,-1.535000,12.950500>}
box{<0,0,-0.127000><0.264859,0.035000,0.127000> rotate<0,10.991018,0> translate<3.045500,-1.535000,13.001000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.305500,-1.535000,12.950500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.997000,-1.535000,12.950500>}
box{<0,0,-0.127000><1.691500,0.035000,0.127000> rotate<0,0.000000,0> translate<3.305500,-1.535000,12.950500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,3.810000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,44.997030,0> translate<1.270000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.889000,-1.535000,23.321000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.889000,-1.535000,23.485000>}
box{<0,0,-0.127000><0.164000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.889000,-1.535000,23.485000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.889000,0.000000,20.945000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.070500,0.000000,20.945000>}
box{<0,0,-0.406400><1.181500,0.035000,0.406400> rotate<0,0.000000,0> translate<5.889000,0.000000,20.945000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.997000,-1.535000,12.950500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,15.573500>}
box{<0,0,-0.127000><3.709482,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.997000,-1.535000,12.950500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.889000,-1.535000,23.321000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,21.590000>}
box{<0,0,-0.127000><2.448004,0.035000,0.127000> rotate<0,44.997030,0> translate<5.889000,-1.535000,23.321000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,15.573500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,21.590000>}
box{<0,0,-0.127000><6.016500,0.035000,0.127000> rotate<0,90.000000,0> translate<7.620000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.070500,0.000000,20.945000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.289000,0.000000,22.163500>}
box{<0,0,-0.406400><1.723219,0.035000,0.406400> rotate<0,-44.997030,0> translate<7.070500,0.000000,20.945000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.682500,-1.535000,20.275500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.685000,-1.535000,20.273000>}
box{<0,0,-0.152400><0.003536,0.035000,0.152400> rotate<0,44.997030,0> translate<10.682500,-1.535000,20.275500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.685000,-1.535000,17.782000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.685000,-1.535000,20.273000>}
box{<0,0,-0.152400><2.491000,0.035000,0.152400> rotate<0,90.000000,0> translate<10.685000,-1.535000,20.273000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.045500,-1.535000,7.921000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.632000,-1.535000,7.874000>}
box{<0,0,-0.152400><8.586629,0.035000,0.152400> rotate<0,0.313597,0> translate<3.045500,-1.535000,7.921000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.471000,-1.535000,20.264000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.471000,-1.535000,18.710000>}
box{<0,0,-0.406400><1.554000,0.035000,0.406400> rotate<0,-90.000000,0> translate<12.471000,-1.535000,18.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,11.654000>}
box{<0,0,-0.152400><3.840000,0.035000,0.152400> rotate<0,-90.000000,0> translate<12.473500,0.000000,11.654000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.045500,0.000000,15.541000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,15.494000>}
box{<0,0,-0.152400><9.428117,0.035000,0.152400> rotate<0,0.285607,0> translate<3.045500,0.000000,15.541000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473000,0.000000,19.326000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,15.494000>}
box{<0,0,-0.152400><3.832000,0.035000,0.152400> rotate<0,89.986585,0> translate<12.473000,0.000000,19.326000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.471000,-1.535000,20.264000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.482500,-1.535000,20.275500>}
box{<0,0,-0.406400><0.016263,0.035000,0.406400> rotate<0,-44.997030,0> translate<12.471000,-1.535000,20.264000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473000,0.000000,19.326000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.482500,0.000000,20.275500>}
box{<0,0,-0.152400><0.949548,0.035000,0.152400> rotate<0,-89.420858,0> translate<12.473000,0.000000,19.326000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,11.654000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.697500,0.000000,11.430000>}
box{<0,0,-0.152400><0.316784,0.035000,0.152400> rotate<0,44.997030,0> translate<12.473500,0.000000,11.654000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.697500,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,0.000000,11.430000>}
box{<0,0,-0.152400><0.002500,0.035000,0.152400> rotate<0,0.000000,0> translate<12.697500,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.045500,-1.535000,10.461000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.954000,-1.535000,10.414000>}
box{<0,0,-0.127000><9.908611,0.035000,0.127000> rotate<0,0.271757,0> translate<3.045500,-1.535000,10.461000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.889000,-1.535000,23.485000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.973500,-1.535000,23.485000>}
box{<0,0,-0.406400><7.084500,0.035000,0.406400> rotate<0,0.000000,0> translate<5.889000,-1.535000,23.485000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.471000,-1.535000,18.710000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.401000,-1.535000,17.780000>}
box{<0,0,-0.406400><1.315219,0.035000,0.406400> rotate<0,44.997030,0> translate<12.471000,-1.535000,18.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.685000,-1.535000,17.782000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.468000,-1.535000,14.999000>}
box{<0,0,-0.152400><3.935756,0.035000,0.152400> rotate<0,44.997030,0> translate<10.685000,-1.535000,17.782000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.282500,0.000000,20.275500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.282500,0.000000,18.737500>}
box{<0,0,-0.406400><1.538000,0.035000,0.406400> rotate<0,-90.000000,0> translate<14.282500,0.000000,18.737500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.282500,-1.535000,20.275500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.288000,-1.535000,20.281000>}
box{<0,0,-0.406400><0.007778,0.035000,0.406400> rotate<0,-44.997030,0> translate<14.282500,-1.535000,20.275500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.288000,-1.535000,22.170500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.288000,-1.535000,20.281000>}
box{<0,0,-0.406400><1.889500,0.035000,0.406400> rotate<0,-90.000000,0> translate<14.288000,-1.535000,20.281000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.973500,-1.535000,23.485000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.288000,-1.535000,22.170500>}
box{<0,0,-0.406400><1.858984,0.035000,0.406400> rotate<0,44.997030,0> translate<12.973500,-1.535000,23.485000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,8.890000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<12.700000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.954000,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,12.700000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.954000,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.282500,0.000000,18.737500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,17.780000>}
box{<0,0,-0.406400><1.354109,0.035000,0.406400> rotate<0,44.997030,0> translate<14.282500,0.000000,18.737500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.234000,-1.535000,5.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.277000,-1.535000,5.969000>}
box{<0,0,-0.127000><0.060811,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.234000,-1.535000,5.926000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.289000,0.000000,22.163500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.456500,0.000000,22.163500>}
box{<0,0,-0.406400><7.167500,0.035000,0.406400> rotate<0,0.000000,0> translate<8.289000,0.000000,22.163500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.494000,-1.535000,9.144000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.240000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.632000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.857500,-1.535000,12.099500>}
box{<0,0,-0.152400><5.975759,0.035000,0.152400> rotate<0,-44.997030,0> translate<11.632000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.098000,0.000000,21.522000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.098000,0.000000,20.291000>}
box{<0,0,-0.406400><1.231000,0.035000,0.406400> rotate<0,-90.000000,0> translate<16.098000,0.000000,20.291000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.456500,0.000000,22.163500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.098000,0.000000,21.522000>}
box{<0,0,-0.406400><0.907218,0.035000,0.406400> rotate<0,44.997030,0> translate<15.456500,0.000000,22.163500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.234000,0.000000,5.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.507500,0.000000,5.926000>}
box{<0,0,-0.127000><2.273500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.234000,0.000000,5.926000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.468000,-1.535000,14.999000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.544000,-1.535000,14.999000>}
box{<0,0,-0.152400><4.076000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.468000,-1.535000,14.999000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.277000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.592000,-1.535000,5.969000>}
box{<0,0,-0.127000><2.315000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.277000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.592000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.592000,-1.535000,5.969000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.592000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.494000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.592000,-1.535000,9.144000>}
box{<0,0,-0.152400><2.098000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.494000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.919500,-1.535000,3.810000>}
box{<0,0,-0.152400><13.839500,0.035000,0.152400> rotate<0,0.000000,0> translate<5.080000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.919500,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.037000,-1.535000,3.927500>}
box{<0,0,-0.152400><0.166170,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.919500,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.037000,-1.535000,3.927500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.037000,-1.535000,3.967000>}
box{<0,0,-0.152400><0.039500,0.035000,0.152400> rotate<0,90.000000,0> translate<19.037000,-1.535000,3.967000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.037000,-1.535000,3.967000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.488500,-1.535000,4.418500>}
box{<0,0,-0.152400><0.638517,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.037000,-1.535000,3.967000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.488500,-1.535000,4.418500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.488500,-1.535000,5.965500>}
box{<0,0,-0.152400><1.547000,0.035000,0.152400> rotate<0,90.000000,0> translate<19.488500,-1.535000,5.965500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.488500,-1.535000,5.965500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.492000,-1.535000,5.969000>}
box{<0,0,-0.152400><0.004950,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.488500,-1.535000,5.965500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.072000,0.000000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.705500,0.000000,1.821500>}
box{<0,0,-0.127000><0.633500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.072000,0.000000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.401000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,17.780000>}
box{<0,0,-0.406400><6.919000,0.035000,0.406400> rotate<0,0.000000,0> translate<13.401000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.321000,0.000000,17.780000>}
box{<0,0,-0.406400><5.081000,0.035000,0.406400> rotate<0,0.000000,0> translate<15.240000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.705500,0.000000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.973000,0.000000,0.554000>}
box{<0,0,-0.127000><1.792516,0.035000,0.127000> rotate<0,44.997030,0> translate<19.705500,0.000000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.492000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.066500,-1.535000,5.969000>}
box{<0,0,-0.152400><1.574500,0.035000,0.152400> rotate<0,0.000000,0> translate<19.492000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.079000,0.000000,18.425500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.079000,0.000000,18.269000>}
box{<0,0,-0.127000><0.156500,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.079000,0.000000,18.269000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.444000,-1.535000,14.999000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.349000,-1.535000,14.999000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.444000,-1.535000,14.999000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.507500,0.000000,5.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.612000,0.000000,1.821500>}
box{<0,0,-0.127000><5.804640,0.035000,0.127000> rotate<0,44.997030,0> translate<17.507500,0.000000,5.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.079000,0.000000,18.425500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.913000,0.000000,19.259500>}
box{<0,0,-0.127000><1.179454,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.079000,0.000000,18.425500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.913000,0.000000,19.372000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.913000,0.000000,19.259500>}
box{<0,0,-0.127000><0.112500,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.913000,0.000000,19.259500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.321000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.913000,0.000000,19.372000>}
box{<0,0,-0.406400><2.251428,0.035000,0.406400> rotate<0,-44.997030,0> translate<20.321000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.913000,0.000000,19.372000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.913000,0.000000,22.425000>}
box{<0,0,-0.406400><3.053000,0.035000,0.406400> rotate<0,90.000000,0> translate<21.913000,0.000000,22.425000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.913000,0.000000,22.425000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.916500,0.000000,22.428500>}
box{<0,0,-0.406400><0.004950,0.035000,0.406400> rotate<0,-44.997030,0> translate<21.913000,0.000000,22.425000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.066500,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.078000,-1.535000,6.980500>}
box{<0,0,-0.152400><1.430477,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.066500,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.078000,0.000000,6.980500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.078000,0.000000,11.938500>}
box{<0,0,-0.152400><4.958000,0.035000,0.152400> rotate<0,90.000000,0> translate<22.078000,0.000000,11.938500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.349000,-1.535000,14.999000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.834500,-1.535000,16.484500>}
box{<0,0,-0.127000><2.100814,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.349000,-1.535000,14.999000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,20.320000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,-44.997030,0> translate<20.320000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.079000,0.000000,18.269000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,0.000000,16.484500>}
box{<0,0,-0.127000><2.523664,0.035000,0.127000> rotate<0,44.997030,0> translate<21.079000,0.000000,18.269000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.834500,-1.535000,16.484500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,-1.535000,16.484500>}
box{<0,0,-0.127000><0.029000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.834500,-1.535000,16.484500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,0.000000,16.484500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,0.000000,16.513500>}
box{<0,0,-0.127000><0.029000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.863500,0.000000,16.513500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.492000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.893500,-1.535000,9.144000>}
box{<0,0,-0.152400><3.401500,0.035000,0.152400> rotate<0,0.000000,0> translate<19.492000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,0.000000,16.513500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,17.780000>}
box{<0,0,-0.127000><1.791101,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.863500,0.000000,16.513500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.152000,-1.535000,5.058000>}
box{<0,0,-0.127000><0.031113,0.035000,0.127000> rotate<0,44.997030,0> translate<24.130000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.152000,-1.535000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.152000,-1.535000,5.058000>}
box{<0,0,-0.127000><3.236500,0.035000,0.127000> rotate<0,90.000000,0> translate<24.152000,-1.535000,5.058000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.893500,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.183000,-1.535000,7.854500>}
box{<0,0,-0.152400><1.823628,0.035000,0.152400> rotate<0,44.997030,0> translate<22.893500,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.888000,-1.535000,20.320000>}
box{<0,0,-0.406400><2.028000,0.035000,0.406400> rotate<0,0.000000,0> translate<22.860000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.916500,-1.535000,22.428500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.888000,-1.535000,25.400000>}
box{<0,0,-0.406400><4.202336,0.035000,0.406400> rotate<0,-44.997030,0> translate<21.916500,-1.535000,22.428500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,20.320000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.860000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,20.744500>}
box{<0,0,-0.127000><0.424500,0.035000,0.127000> rotate<0,90.000000,0> translate<25.400000,-1.535000,20.744500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.078000,0.000000,11.938500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.788000,0.000000,15.648500>}
box{<0,0,-0.152400><5.246732,0.035000,0.152400> rotate<0,-44.997030,0> translate<22.078000,0.000000,11.938500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.973000,0.000000,0.554000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.042500,0.000000,0.554000>}
box{<0,0,-0.127000><5.069500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.973000,0.000000,0.554000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.163500,-1.535000,7.113500>}
box{<0,0,-0.127000><2.875803,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.130000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.163500,-1.535000,7.113500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.163500,-1.535000,11.077000>}
box{<0,0,-0.127000><3.963500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.163500,-1.535000,11.077000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.163500,0.000000,11.077000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.412500,0.000000,11.326000>}
box{<0,0,-0.127000><0.352139,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.163500,0.000000,11.077000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.412500,0.000000,11.326000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.412500,0.000000,14.464500>}
box{<0,0,-0.127000><3.138500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.412500,0.000000,14.464500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.042500,0.000000,0.554000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.692000,0.000000,1.203500>}
box{<0,0,-0.127000><0.918532,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.042500,0.000000,0.554000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.692000,0.000000,1.203500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.692000,0.000000,1.821500>}
box{<0,0,-0.127000><0.618000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.692000,0.000000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.412500,0.000000,14.464500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.953000,0.000000,15.005000>}
box{<0,0,-0.127000><0.764382,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.412500,0.000000,14.464500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,20.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.986500,-1.535000,22.331000>}
box{<0,0,-0.127000><2.243650,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.400000,-1.535000,20.744500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.888000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.996500,-1.535000,22.428500>}
box{<0,0,-0.406400><2.981869,0.035000,0.406400> rotate<0,-44.997030,0> translate<24.888000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.996500,-1.535000,22.428500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.170500,-1.535000,22.254500>}
box{<0,0,-0.406400><0.246073,0.035000,0.406400> rotate<0,44.997030,0> translate<26.996500,-1.535000,22.428500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.692000,0.000000,1.203500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.324000,0.000000,0.571500>}
box{<0,0,-0.127000><0.893783,0.035000,0.127000> rotate<0,44.997030,0> translate<26.692000,0.000000,1.203500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,17.780000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.938100,0.000000,15.663100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.946200,0.000000,15.655000>}
box{<0,0,-0.127000><0.011455,0.035000,0.127000> rotate<0,44.997030,0> translate<27.938100,0.000000,15.663100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.938100,0.000000,15.663100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.081300,0.000000,15.663700>}
box{<0,0,-0.127000><0.143201,0.035000,0.127000> rotate<0,-0.240049,0> translate<27.938100,0.000000,15.663100> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.788000,0.000000,15.648500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.087500,0.000000,15.648500>}
box{<0,0,-0.152400><2.299500,0.035000,0.152400> rotate<0,0.000000,0> translate<25.788000,0.000000,15.648500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.183000,0.000000,7.854500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.093500,0.000000,7.854500>}
box{<0,0,-0.152400><3.910500,0.035000,0.152400> rotate<0,0.000000,0> translate<24.183000,0.000000,7.854500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.093500,0.000000,7.854500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.094000,0.000000,7.855000>}
box{<0,0,-0.152400><0.000707,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.093500,0.000000,7.854500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.953000,0.000000,15.005000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.094000,0.000000,15.005000>}
box{<0,0,-0.127000><1.141000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.953000,0.000000,15.005000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.946200,0.000000,15.655000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.094000,0.000000,15.655000>}
box{<0,0,-0.127000><0.147800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.946200,0.000000,15.655000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.087500,0.000000,15.648500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.094000,0.000000,15.655000>}
box{<0,0,-0.152400><0.009192,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.087500,0.000000,15.648500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.094000,0.000000,11.105000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.097000,0.000000,11.102000>}
box{<0,0,-0.127000><0.004243,0.035000,0.127000> rotate<0,44.997030,0> translate<28.094000,0.000000,11.105000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.332000,-1.535000,12.700000>}
box{<0,0,-0.127000><13.092000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.240000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.857500,-1.535000,12.099500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.620000,-1.535000,12.099500>}
box{<0,0,-0.127000><12.762500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.857500,-1.535000,12.099500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.097000,0.000000,11.102000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.129000,0.000000,11.102000>}
box{<0,0,-0.127000><1.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.097000,0.000000,11.102000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.129000,0.000000,11.102000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,11.183000>}
box{<0,0,-0.152400><0.114551,0.035000,0.152400> rotate<0,-44.997030,0> translate<29.129000,0.000000,11.102000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,11.183000>}
box{<0,0,-0.127000><5.327000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.210000,0.000000,11.183000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,16.510000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<27.940000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.213000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.213000,0.000000,1.840500>}
box{<0,0,-0.127000><3.239500,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.213000,0.000000,1.840500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.213000,0.000000,5.080000>}
box{<0,0,-0.152400><0.003000,0.035000,0.152400> rotate<0,0.000000,0> translate<29.210000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.213000,0.000000,1.840500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.232000,0.000000,1.821500>}
box{<0,0,-0.127000><0.026870,0.035000,0.127000> rotate<0,44.997030,0> translate<29.213000,0.000000,1.840500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.094000,0.000000,7.855000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.327000,0.000000,7.855000>}
box{<0,0,-0.152400><1.233000,0.035000,0.152400> rotate<0,0.000000,0> translate<28.094000,0.000000,7.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,0.000000,10.935500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,0.000000,10.076000>}
box{<0,0,-0.127000><0.859500,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.457500,0.000000,10.076000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,11.183000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,0.000000,10.935500>}
box{<0,0,-0.127000><0.350018,0.035000,0.127000> rotate<0,44.997030,0> translate<29.210000,0.000000,11.183000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.448000,-1.535000,11.649500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464500,-1.535000,11.633000>}
box{<0,0,-0.127000><0.023335,0.035000,0.127000> rotate<0,44.997030,0> translate<29.448000,-1.535000,11.649500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464500,-1.535000,7.477000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464500,-1.535000,11.633000>}
box{<0,0,-0.127000><4.156000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.464500,-1.535000,11.633000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.213000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.692500,0.000000,5.559500>}
box{<0,0,-0.152400><0.678115,0.035000,0.152400> rotate<0,-44.997030,0> translate<29.213000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.692500,0.000000,7.489500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.692500,0.000000,5.559500>}
box{<0,0,-0.152400><1.930000,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.692500,0.000000,5.559500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.327000,0.000000,7.855000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.692500,0.000000,7.489500>}
box{<0,0,-0.152400><0.516895,0.035000,0.152400> rotate<0,44.997030,0> translate<29.327000,0.000000,7.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,0.000000,10.076000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.725000,0.000000,9.808500>}
box{<0,0,-0.127000><0.378302,0.035000,0.127000> rotate<0,44.997030,0> translate<29.457500,0.000000,10.076000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.324000,0.000000,0.571500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.907000,0.000000,0.571500>}
box{<0,0,-0.127000><2.583000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.324000,0.000000,0.571500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.725000,0.000000,9.808500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.368500,0.000000,9.808500>}
box{<0,0,-0.127000><0.643500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.725000,0.000000,9.808500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.368500,0.000000,9.808500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.372000,0.000000,9.805000>}
box{<0,0,-0.127000><0.004950,0.035000,0.127000> rotate<0,44.997030,0> translate<30.368500,0.000000,9.808500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,10.795000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.480000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.372000,0.000000,9.805000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.493000,0.000000,9.805000>}
box{<0,0,-0.127000><0.121000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.372000,0.000000,9.805000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.448000,-1.535000,11.649500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.504000,-1.535000,12.705500>}
box{<0,0,-0.127000><1.493410,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.448000,-1.535000,11.649500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.504000,-1.535000,12.705500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.504000,-1.535000,12.706000>}
box{<0,0,-0.127000><0.000500,0.035000,0.127000> rotate<0,90.000000,0> translate<30.504000,-1.535000,12.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.907000,0.000000,0.571500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.508000,0.000000,1.172500>}
box{<0,0,-0.127000><0.849942,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.907000,0.000000,0.571500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.493000,0.000000,9.805000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.513000,0.000000,8.966500>}
box{<0,0,-0.127000><0.838738,0.035000,0.127000> rotate<0,88.627784,0> translate<30.493000,0.000000,9.805000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.508000,0.000000,1.172500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.513000,0.000000,8.966500>}
box{<0,0,-0.127000><7.794002,0.035000,0.127000> rotate<0,-89.957306,0> translate<30.508000,0.000000,1.172500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.504000,0.000000,12.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.518000,0.000000,12.692000>}
box{<0,0,-0.127000><0.019799,0.035000,0.127000> rotate<0,44.997030,0> translate<30.504000,0.000000,12.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.620000,-1.535000,12.099500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.666500,-1.535000,14.146000>}
box{<0,0,-0.127000><2.894188,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.620000,-1.535000,12.099500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.666500,-1.535000,14.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.899000,-1.535000,14.146000>}
box{<0,0,-0.127000><0.232500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.666500,-1.535000,14.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.899000,0.000000,14.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.978500,0.000000,14.135000>}
box{<0,0,-0.127000><0.080257,0.035000,0.127000> rotate<0,7.877180,0> translate<30.899000,0.000000,14.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.518000,0.000000,12.692000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.994000,0.000000,12.692000>}
box{<0,0,-0.127000><0.476000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.518000,0.000000,12.692000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.332000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.057000,-1.535000,15.685000>}
box{<0,0,-0.127000><4.041763,0.035000,0.127000> rotate<0,-47.603972,0> translate<28.332000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,8.890000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<30.480000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,8.890000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.750000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.978500,0.000000,14.135000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.834500,0.000000,14.991000>}
box{<0,0,-0.127000><1.210567,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.978500,0.000000,14.135000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.986500,-1.535000,22.331000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.191500,-1.535000,22.331000>}
box{<0,0,-0.127000><5.205000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.986500,-1.535000,22.331000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.375000,-1.535000,16.265500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.380500,-1.535000,16.271000>}
box{<0,0,-0.127000><0.007778,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.375000,-1.535000,16.265500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.380500,-1.535000,22.142000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.380500,-1.535000,16.271000>}
box{<0,0,-0.127000><5.871000,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.380500,-1.535000,16.271000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.191500,-1.535000,22.331000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.380500,-1.535000,22.142000>}
box{<0,0,-0.127000><0.267286,0.035000,0.127000> rotate<0,44.997030,0> translate<32.191500,-1.535000,22.331000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,6.985000>}
box{<0,0,-0.127000><4.445000,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,-1.535000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.375000,-1.535000,16.265500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,11.430000>}
box{<0,0,-0.127000><4.835510,0.035000,0.127000> rotate<0,89.875578,0> translate<32.375000,-1.535000,16.265500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.994000,0.000000,12.692000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.657000,0.000000,14.355000>}
box{<0,0,-0.127000><2.351837,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.994000,0.000000,12.692000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,6.347500>}
box{<0,0,-0.127000><0.002500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.020000,-1.535000,6.347500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,6.350000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<32.385000,-1.535000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.772000,-1.535000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.067500,-1.535000,0.526000>}
box{<0,0,-0.127000><1.832114,0.035000,0.127000> rotate<0,44.997030,0> translate<31.772000,-1.535000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244000,0.000000,13.716000>}
box{<0,0,-0.127000><4.021435,0.035000,0.127000> rotate<0,-46.578835,0> translate<30.480000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.298000,0.000000,10.471500>}
box{<0,0,-0.127000><1.323741,0.035000,0.127000> rotate<0,46.389642,0> translate<32.385000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.528000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.528000,-1.535000,12.446000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.528000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.528000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.137000,0.000000,13.055000>}
box{<0,0,-0.127000><0.861256,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.528000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464500,-1.535000,7.477000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.312000,-1.535000,2.629500>}
box{<0,0,-0.127000><6.855400,0.035000,0.127000> rotate<0,44.997030,0> translate<29.464500,-1.535000,7.477000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.312000,-1.535000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.312000,-1.535000,2.629500>}
box{<0,0,-0.127000><0.808000,0.035000,0.127000> rotate<0,90.000000,0> translate<34.312000,-1.535000,2.629500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.417000,0.000000,13.716000>}
box{<0,0,-0.127000><1.173000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.244000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.057000,0.000000,15.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.371000,0.000000,15.690000>}
box{<0,0,-0.127000><4.314003,0.035000,0.127000> rotate<0,-0.066402,0> translate<31.057000,0.000000,15.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.834500,0.000000,14.991000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.392000,0.000000,14.991000>}
box{<0,0,-0.127000><3.557500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.834500,0.000000,14.991000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.493000,0.000000,9.805000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,9.805000>}
box{<0,0,-0.127000><4.913000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.493000,0.000000,9.805000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.298000,0.000000,10.471500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,10.455000>}
box{<0,0,-0.127000><2.108065,0.035000,0.127000> rotate<0,0.448434,0> translate<33.298000,0.000000,10.471500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.137000,0.000000,13.055000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,13.055000>}
box{<0,0,-0.127000><1.269000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.137000,0.000000,13.055000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.417000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,13.705000>}
box{<0,0,-0.127000><0.989061,0.035000,0.127000> rotate<0,0.637195,0> translate<34.417000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.657000,0.000000,14.355000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,14.355000>}
box{<0,0,-0.127000><2.749000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.657000,0.000000,14.355000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.392000,0.000000,14.991000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,15.005000>}
box{<0,0,-0.127000><0.019799,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.392000,0.000000,14.991000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.371000,0.000000,15.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,15.655000>}
box{<0,0,-0.127000><0.049497,0.035000,0.127000> rotate<0,44.997030,0> translate<35.371000,0.000000,15.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,11.755000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.407500,0.000000,11.753500>}
box{<0,0,-0.127000><0.002121,0.035000,0.127000> rotate<0,44.997030,0> translate<35.406000,0.000000,11.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,11.105000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.410500,0.000000,11.109500>}
box{<0,0,-0.127000><0.006364,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.406000,0.000000,11.105000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,12.405000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.411000,0.000000,12.400000>}
box{<0,0,-0.127000><0.007071,0.035000,0.127000> rotate<0,44.997030,0> translate<35.406000,0.000000,12.405000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,9.805000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.432000,0.000000,9.779000>}
box{<0,0,-0.127000><0.036770,0.035000,0.127000> rotate<0,44.997030,0> translate<35.406000,0.000000,9.805000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,10.455000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.447000,0.000000,10.414000>}
box{<0,0,-0.127000><0.057983,0.035000,0.127000> rotate<0,44.997030,0> translate<35.406000,0.000000,10.455000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.528000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,-1.535000,5.080000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,44.997030,0> translate<33.528000,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,6.347500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.267500,-1.535000,3.100000>}
box{<0,0,-0.127000><4.592659,0.035000,0.127000> rotate<0,44.997030,0> translate<33.020000,-1.535000,6.347500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.278500,-1.535000,1.821500>}
box{<0,0,-0.127000><6.404266,0.035000,0.127000> rotate<0,44.997030,0> translate<31.750000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.411000,0.000000,12.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.507500,0.000000,12.400000>}
box{<0,0,-0.127000><1.096500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.411000,0.000000,12.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.407500,0.000000,11.753500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.635000,0.000000,11.753500>}
box{<0,0,-0.127000><1.227500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.407500,0.000000,11.753500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.410500,0.000000,11.109500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.738000,0.000000,11.109500>}
box{<0,0,-0.127000><1.327500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.410500,0.000000,11.109500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.278500,-1.535000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.852000,-1.535000,1.821500>}
box{<0,0,-0.127000><0.573500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.278500,-1.535000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.432000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084000,0.000000,9.779000>}
box{<0,0,-0.127000><1.652000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.432000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.447000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.338000,0.000000,10.414000>}
box{<0,0,-0.127000><1.891000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.447000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.067500,-1.535000,0.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.470500,-1.535000,0.526000>}
box{<0,0,-0.127000><4.403000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.067500,-1.535000,0.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.267500,-1.535000,3.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.540000,-1.535000,3.100000>}
box{<0,0,-0.127000><1.272500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.267500,-1.535000,3.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.507500,0.000000,12.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.575000,0.000000,13.467500>}
box{<0,0,-0.127000><1.509673,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.507500,0.000000,12.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.575000,0.000000,13.467500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.575000,0.000000,17.210000>}
box{<0,0,-0.127000><3.742500,0.035000,0.127000> rotate<0,90.000000,0> translate<37.575000,0.000000,17.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.470500,-1.535000,0.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,1.155500>}
box{<0,0,-0.127000><0.890247,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.470500,-1.535000,0.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,1.155500>}
box{<0,0,-0.127000><1.384500,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.100000,-1.535000,1.155500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.540000,-1.535000,3.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,2.540000>}
box{<0,0,-0.127000><0.791960,0.035000,0.127000> rotate<0,44.997030,0> translate<37.540000,-1.535000,3.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,5.080000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.560000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.635000,0.000000,11.753500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,13.218500>}
box{<0,0,-0.127000><2.071823,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.635000,0.000000,11.753500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,13.218500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,15.240000>}
box{<0,0,-0.127000><2.021500,0.035000,0.127000> rotate<0,90.000000,0> translate<38.100000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.738000,0.000000,11.109500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.201500,0.000000,12.573000>}
box{<0,0,-0.127000><2.069702,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.738000,0.000000,11.109500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.338000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.216000,0.000000,9.536000>}
box{<0,0,-0.127000><1.241680,0.035000,0.127000> rotate<0,44.997030,0> translate<37.338000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,0.000000,15.367000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.100000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.575000,0.000000,17.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.526000,0.000000,18.161000>}
box{<0,0,-0.127000><1.344917,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.575000,0.000000,17.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.127000,0.000000,7.736000>}
box{<0,0,-0.127000><2.889238,0.035000,0.127000> rotate<0,44.997030,0> translate<37.084000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.201500,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.309000,0.000000,12.573000>}
box{<0,0,-0.127000><1.107500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.201500,0.000000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.309000,0.000000,15.367000>}
box{<0,0,-0.127000><1.082000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.227000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.526000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.309000,0.000000,18.161000>}
box{<0,0,-0.127000><0.783000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.526000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,-1.535000,3.810000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<38.100000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,-1.535000,1.843500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,-1.535000,3.810000>}
box{<0,0,-0.127000><1.966500,0.035000,0.127000> rotate<0,90.000000,0> translate<39.370000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.127000,0.000000,7.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,7.736000>}
box{<0,0,-0.127000><0.243000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.127000,0.000000,7.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.216000,0.000000,9.536000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,9.536000>}
box{<0,0,-0.127000><1.154000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.216000,0.000000,9.536000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,-1.535000,1.843500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.392000,-1.535000,1.821500>}
box{<0,0,-0.127000><0.031113,0.035000,0.127000> rotate<0,44.997030,0> translate<39.370000,-1.535000,1.843500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.170500,-1.535000,22.254500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.008500,-1.535000,22.254500>}
box{<0,0,-0.406400><12.838000,0.035000,0.406400> rotate<0,0.000000,0> translate<27.170500,-1.535000,22.254500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.008500,-1.535000,22.254500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.614000,-1.535000,22.860000>}
box{<0,0,-0.406400><0.856306,0.035000,0.406400> rotate<0,-44.997030,0> translate<40.008500,-1.535000,22.254500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.209000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.037000,0.000000,12.573000>}
box{<0,0,-0.127000><0.828000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.209000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.209000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,0.000000,18.161000>}
box{<0,0,-0.127000><1.082000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.209000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.209000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.046000,0.000000,15.367000>}
box{<0,0,-0.127000><1.837000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.209000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.046000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.179000,0.000000,15.500000>}
box{<0,0,-0.127000><0.188090,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.046000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,8.890000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.180000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.037000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,11.430000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<42.037000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,19.050000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.291000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,21.590000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.180000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.187000,0.000000,8.890000>}
box{<0,0,-0.127000><0.007000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.187000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.193500,0.000000,7.883500>}
box{<0,0,-0.127000><1.423406,0.035000,0.127000> rotate<0,44.997030,0> translate<43.187000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,22.860000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.180000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.828500,0.000000,16.939500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.828500,0.000000,21.791000>}
box{<0,0,-0.406400><4.851500,0.035000,0.406400> rotate<0,90.000000,0> translate<44.828500,0.000000,21.791000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.828500,0.000000,21.791000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.906500,0.000000,21.869000>}
box{<0,0,-0.406400><0.110309,0.035000,0.406400> rotate<0,-44.997030,0> translate<44.828500,0.000000,21.791000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.174500,0.000000,16.412000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.174500,0.000000,19.139500>}
box{<0,0,-0.127000><2.727500,0.035000,0.127000> rotate<0,90.000000,0> translate<45.174500,0.000000,19.139500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.174500,0.000000,19.139500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.190500,0.000000,19.139500>}
box{<0,0,-0.127000><0.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.174500,0.000000,19.139500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.190500,0.000000,19.139500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.190500,0.000000,20.697500>}
box{<0,0,-0.127000><1.558000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.190500,0.000000,20.697500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.174500,0.000000,16.412000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.272500,0.000000,16.510000>}
box{<0,0,-0.127000><0.138593,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.174500,0.000000,16.412000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.585000,0.000000,22.860000>}
box{<0,0,-0.127000><2.135000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.450000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.179000,0.000000,15.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.718000,0.000000,15.500000>}
box{<0,0,-0.127000><3.539000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.179000,0.000000,15.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.193500,0.000000,7.883500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.721500,0.000000,7.883500>}
box{<0,0,-0.127000><2.528000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.193500,0.000000,7.883500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.721500,0.000000,7.883500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.726000,0.000000,7.888000>}
box{<0,0,-0.127000><0.006364,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.721500,0.000000,7.883500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.718000,0.000000,15.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.726000,0.000000,15.508000>}
box{<0,0,-0.127000><0.011314,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.718000,0.000000,15.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.585000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.726000,0.000000,23.001000>}
box{<0,0,-0.127000><0.199404,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.585000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.720000,0.000000,5.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,5.588000>}
box{<0,0,-0.127000><0.022627,0.035000,0.127000> rotate<0,44.997030,0> translate<46.720000,0.000000,5.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.190500,0.000000,20.697500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,20.697500>}
box{<0,0,-0.127000><1.545500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.190500,0.000000,20.697500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,20.697500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,20.701000>}
box{<0,0,-0.127000><0.003500,0.035000,0.127000> rotate<0,90.000000,0> translate<46.736000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,0.000000,13.208000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.736000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.272500,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,16.510000>}
box{<0,0,-0.127000><2.987500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.272500,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.614000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.260000,-1.535000,22.860000>}
box{<0,0,-0.406400><7.646000,0.035000,0.406400> rotate<0,0.000000,0> translate<40.614000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.736000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.022000,0.000000,13.208000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,0.000000,0> translate<46.736000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.288500,0.000000,13.208000>}
box{<0,0,-0.127000><2.552500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.736000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.022000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,12.700000>}
box{<0,0,-0.406400><0.718420,0.035000,0.406400> rotate<0,44.997030,0> translate<49.022000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,0.000000,16.510000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.260000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,16.510000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<49.530000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,16.635500>}
box{<0,0,-0.406400><0.125500,0.035000,0.406400> rotate<0,90.000000,0> translate<49.530000,0.000000,16.635500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.595500,0.000000,4.485000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.789500,0.000000,4.484500>}
box{<0,0,-0.127000><1.194000,0.035000,0.127000> rotate<0,0.023992,0> translate<48.595500,0.000000,4.485000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.828500,0.000000,16.939500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.834000,0.000000,16.939500>}
box{<0,0,-0.406400><5.005500,0.035000,0.406400> rotate<0,0.000000,0> translate<44.828500,0.000000,16.939500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,16.635500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.834000,0.000000,16.939500>}
box{<0,0,-0.406400><0.429921,0.035000,0.406400> rotate<0,-44.997030,0> translate<49.530000,0.000000,16.635500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.288500,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.874000,0.000000,13.433000>}
box{<0,0,-0.127000><0.627244,0.035000,0.127000> rotate<0,-21.019728,0> translate<49.288500,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.881000,0.000000,14.646500>}
box{<0,0,-0.127000><1.896268,0.035000,0.127000> rotate<0,79.327779,0> translate<49.530000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.874000,0.000000,13.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.881000,0.000000,14.646500>}
box{<0,0,-0.127000><1.213520,0.035000,0.127000> rotate<0,-89.663579,0> translate<49.874000,0.000000,13.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.288500,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.816000,0.000000,13.208000>}
box{<0,0,-0.127000><2.527500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.288500,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.816000,0.000000,20.701000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.736000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.726000,0.000000,3.288000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.892000,0.000000,3.288000>}
box{<0,0,-0.406400><8.166000,0.035000,0.406400> rotate<0,0.000000,0> translate<46.726000,0.000000,3.288000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.726000,0.000000,10.908000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.933000,0.000000,10.908000>}
box{<0,0,-0.406400><10.207000,0.035000,0.406400> rotate<0,0.000000,0> translate<46.726000,0.000000,10.908000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.888000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,-1.535000,25.400000>}
box{<0,0,-0.406400><32.262000,0.035000,0.406400> rotate<0,0.000000,0> translate<24.888000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.726000,0.000000,18.401000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.441000,0.000000,18.401000>}
box{<0,0,-0.406400><10.715000,0.035000,0.406400> rotate<0,0.000000,0> translate<46.726000,0.000000,18.401000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.933000,0.000000,10.908000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.144500,0.000000,12.119500>}
box{<0,0,-0.406400><1.713320,0.035000,0.406400> rotate<0,-44.997030,0> translate<56.933000,0.000000,10.908000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,22.860000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<58.420000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,24.130000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<57.150000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.144500,0.000000,12.119500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.182500,0.000000,12.119500>}
box{<0,0,-0.406400><3.038000,0.035000,0.406400> rotate<0,0.000000,0> translate<58.144500,0.000000,12.119500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.892000,0.000000,3.288000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,0.000000,9.579000>}
box{<0,0,-0.406400><8.896818,0.035000,0.406400> rotate<0,-44.997030,0> translate<54.892000,0.000000,3.288000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.182500,0.000000,12.119500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,0.000000,12.119000>}
box{<0,0,-0.406400><0.000707,0.035000,0.406400> rotate<0,44.997030,0> translate<61.182500,0.000000,12.119500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.441000,0.000000,18.401000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,0.000000,14.659000>}
box{<0,0,-0.406400><5.291987,0.035000,0.406400> rotate<0,44.997030,0> translate<57.441000,0.000000,18.401000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,-1.535000,20.097000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,-1.535000,17.199000>}
box{<0,0,-0.406400><2.898000,0.035000,0.406400> rotate<0,-90.000000,0> translate<61.183000,-1.535000,17.199000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,-1.535000,20.097000>}
box{<0,0,-0.406400><3.907472,0.035000,0.406400> rotate<0,44.997030,0> translate<58.420000,-1.535000,22.860000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,0.000000>}
box{<0,0,-0.127000><25.400000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,0.000000>}
box{<0,0,-0.127000><33.020000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,0.000000>}
box{<0,0,-0.127000><26.670000,0.035000,0.127000> rotate<0,-90.000000,0> translate<0.000000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,0.000000>}
box{<0,0,-0.127000><26.670000,0.035000,0.127000> rotate<0,-90.000000,0> translate<0.000000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,26.670000>}
box{<0,0,-0.127000><25.400000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,26.670000>}
box{<0,0,-0.127000><33.020000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,26.670000>}
box{<0,0,-0.127000><26.670000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,26.670000>}
box{<0,0,-0.127000><26.670000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.020000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,23.876000>}
box{<0,0,-0.127000><21.590000,0.035000,0.127000> rotate<0,90.000000,0> translate<44.450000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,23.876000>}
box{<0,0,-0.304800><21.590000,0.035000,0.304800> rotate<0,90.000000,0> translate<44.450000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.135000,-1.535000,2.216000>}
box{<0,0,-0.304800><12.685193,0.035000,0.304800> rotate<0,0.316153,0> translate<44.450000,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,2.286000>}
box{<0,0,-0.127000><12.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.450000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.164500,-1.535000,23.888000>}
box{<0,0,-0.304800><12.714506,0.035000,0.304800> rotate<0,-0.054072,0> translate<44.450000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.204500,0.000000,23.837000>}
box{<0,0,-0.127000><12.754560,0.035000,0.127000> rotate<0,0.175184,0> translate<44.450000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.135000,-1.535000,2.216000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.164500,-1.535000,23.888000>}
box{<0,0,-0.304800><21.672020,0.035000,0.304800> rotate<0,-89.916074,0> translate<57.135000,-1.535000,2.216000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.204500,0.000000,23.837000>}
box{<0,0,-0.127000><21.551069,0.035000,0.127000> rotate<0,-89.849176,0> translate<57.150000,0.000000,2.286000> }
texture{col_pol}
}
#end
union{
cylinder{<5.889000,0.038000,23.485000><5.889000,-1.538000,23.485000>0.508000}
cylinder{<5.889000,0.038000,20.945000><5.889000,-1.538000,20.945000>0.508000}
cylinder{<26.996500,0.038000,22.428500><26.996500,-1.538000,22.428500>0.406400}
cylinder{<21.916500,0.038000,22.428500><21.916500,-1.538000,22.428500>0.406400}
cylinder{<61.183000,0.038000,17.199000><61.183000,-1.538000,17.199000>0.508000}
cylinder{<61.183000,0.038000,14.659000><61.183000,-1.538000,14.659000>0.508000}
cylinder{<61.183000,0.038000,12.119000><61.183000,-1.538000,12.119000>0.508000}
cylinder{<61.183000,0.038000,9.579000><61.183000,-1.538000,9.579000>0.508000}
cylinder{<19.072000,0.038000,1.821500><19.072000,-1.538000,1.821500>0.508000}
cylinder{<21.612000,0.038000,1.821500><21.612000,-1.538000,1.821500>0.508000}
cylinder{<24.152000,0.038000,1.821500><24.152000,-1.538000,1.821500>0.508000}
cylinder{<26.692000,0.038000,1.821500><26.692000,-1.538000,1.821500>0.508000}
cylinder{<29.232000,0.038000,1.821500><29.232000,-1.538000,1.821500>0.508000}
cylinder{<31.772000,0.038000,1.821500><31.772000,-1.538000,1.821500>0.508000}
cylinder{<34.312000,0.038000,1.821500><34.312000,-1.538000,1.821500>0.508000}
cylinder{<36.852000,0.038000,1.821500><36.852000,-1.538000,1.821500>0.508000}
cylinder{<39.392000,0.038000,1.821500><39.392000,-1.538000,1.821500>0.508000}
cylinder{<3.045500,0.038000,18.081000><3.045500,-1.538000,18.081000>0.508000}
cylinder{<3.045500,0.038000,15.541000><3.045500,-1.538000,15.541000>0.508000}
cylinder{<3.045500,0.038000,13.001000><3.045500,-1.538000,13.001000>0.508000}
cylinder{<3.045500,0.038000,10.461000><3.045500,-1.538000,10.461000>0.508000}
cylinder{<3.045500,0.038000,7.921000><3.045500,-1.538000,7.921000>0.508000}
cylinder{<10.682500,0.038000,20.275500><10.682500,-1.538000,20.275500>0.500000}
cylinder{<12.482500,0.038000,20.275500><12.482500,-1.538000,20.275500>0.500000}
cylinder{<14.282500,0.038000,20.275500><14.282500,-1.538000,20.275500>0.500000}
cylinder{<16.082500,0.038000,20.275500><16.082500,-1.538000,20.275500>0.500000}
cylinder{<17.882500,0.038000,20.275500><17.882500,-1.538000,20.275500>0.500000}
//Holes(fast)/Vias
cylinder{<33.528000,0.038000,12.446000><33.528000,-1.538000,12.446000>0.254000 }
cylinder{<22.863500,0.038000,16.484500><22.863500,-1.538000,16.484500>0.300000 }
cylinder{<30.480000,0.038000,10.795000><30.480000,-1.538000,10.795000>0.254000 }
cylinder{<22.078000,0.038000,6.980500><22.078000,-1.538000,6.980500>0.300000 }
cylinder{<24.183000,0.038000,7.854500><24.183000,-1.538000,7.854500>0.300000 }
cylinder{<30.899000,0.038000,14.146000><30.899000,-1.538000,14.146000>0.250000 }
cylinder{<31.057000,0.038000,15.685000><31.057000,-1.538000,15.685000>0.250000 }
cylinder{<26.163500,0.038000,11.077000><26.163500,-1.538000,11.077000>0.250000 }
cylinder{<30.504000,0.038000,12.706000><30.504000,-1.538000,12.706000>0.254000 }
cylinder{<32.385000,0.038000,11.430000><32.385000,-1.538000,11.430000>0.254000 }
cylinder{<49.530000,0.038000,16.510000><49.530000,-1.538000,16.510000>0.250000 }
cylinder{<48.260000,0.038000,16.510000><48.260000,-1.538000,16.510000>0.250000 }
cylinder{<49.881000,0.038000,14.646500><49.881000,-1.538000,14.646500>0.250000 }
cylinder{<49.874000,0.038000,13.433000><49.874000,-1.538000,13.433000>0.250000 }
cylinder{<48.602500,0.038000,21.962500><48.602500,-1.538000,21.962500>0.250000 }
cylinder{<49.820000,0.038000,21.962000><49.820000,-1.538000,21.962000>0.250000 }
cylinder{<49.820000,0.038000,20.798000><49.820000,-1.538000,20.798000>0.250000 }
cylinder{<48.628500,0.038000,19.633500><48.628500,-1.538000,19.633500>0.250000 }
cylinder{<49.820000,0.038000,19.633000><49.820000,-1.538000,19.633000>0.250000 }
cylinder{<53.340000,0.038000,22.860000><53.340000,-1.538000,22.860000>0.250000 }
cylinder{<54.610000,0.038000,22.860000><54.610000,-1.538000,22.860000>0.250000 }
cylinder{<55.880000,0.038000,22.860000><55.880000,-1.538000,22.860000>0.250000 }
cylinder{<54.610000,0.038000,21.590000><54.610000,-1.538000,21.590000>0.250000 }
cylinder{<55.880000,0.038000,21.590000><55.880000,-1.538000,21.590000>0.250000 }
cylinder{<55.880000,0.038000,20.320000><55.880000,-1.538000,20.320000>0.250000 }
cylinder{<54.610000,0.038000,20.320000><54.610000,-1.538000,20.320000>0.250000 }
cylinder{<50.800000,0.038000,16.510000><50.800000,-1.538000,16.510000>0.250000 }
cylinder{<48.743500,0.038000,14.669000><48.743500,-1.538000,14.669000>0.250000 }
cylinder{<48.721500,0.038000,13.442500><48.721500,-1.538000,13.442500>0.250000 }
cylinder{<48.743000,0.038000,12.150000><48.743000,-1.538000,12.150000>0.250000 }
cylinder{<49.859500,0.038000,12.111500><49.859500,-1.538000,12.111500>0.250000 }
cylinder{<52.070000,0.038000,16.510000><52.070000,-1.538000,16.510000>0.250000 }
cylinder{<53.340000,0.038000,16.510000><53.340000,-1.538000,16.510000>0.250000 }
cylinder{<54.610000,0.038000,16.510000><54.610000,-1.538000,16.510000>0.250000 }
cylinder{<55.880000,0.038000,16.510000><55.880000,-1.538000,16.510000>0.250000 }
cylinder{<54.610000,0.038000,15.240000><54.610000,-1.538000,15.240000>0.250000 }
cylinder{<55.880000,0.038000,15.240000><55.880000,-1.538000,15.240000>0.250000 }
cylinder{<54.610000,0.038000,13.970000><54.610000,-1.538000,13.970000>0.250000 }
cylinder{<55.880000,0.038000,13.970000><55.880000,-1.538000,13.970000>0.250000 }
cylinder{<54.610000,0.038000,12.700000><54.610000,-1.538000,12.700000>0.250000 }
cylinder{<55.880000,0.038000,12.700000><55.880000,-1.538000,12.700000>0.250000 }
cylinder{<55.880000,0.038000,8.890000><55.880000,-1.538000,8.890000>0.250000 }
cylinder{<55.880000,0.038000,7.620000><55.880000,-1.538000,7.620000>0.250000 }
cylinder{<55.880000,0.038000,6.350000><55.880000,-1.538000,6.350000>0.250000 }
cylinder{<54.610000,0.038000,5.080000><54.610000,-1.538000,5.080000>0.250000 }
cylinder{<54.610000,0.038000,6.350000><54.610000,-1.538000,6.350000>0.250000 }
cylinder{<54.610000,0.038000,7.620000><54.610000,-1.538000,7.620000>0.250000 }
cylinder{<54.610000,0.038000,8.890000><54.610000,-1.538000,8.890000>0.250000 }
cylinder{<53.340000,0.038000,8.890000><53.340000,-1.538000,8.890000>0.250000 }
cylinder{<53.340000,0.038000,7.620000><53.340000,-1.538000,7.620000>0.250000 }
cylinder{<52.070000,0.038000,8.890000><52.070000,-1.538000,8.890000>0.250000 }
cylinder{<50.800000,0.038000,8.890000><50.800000,-1.538000,8.890000>0.250000 }
cylinder{<49.530000,0.038000,8.890000><49.530000,-1.538000,8.890000>0.250000 }
cylinder{<48.260000,0.038000,8.890000><48.260000,-1.538000,8.890000>0.250000 }
cylinder{<48.595500,0.038000,6.826500><48.595500,-1.538000,6.826500>0.250000 }
cylinder{<49.789500,0.038000,6.811000><49.789500,-1.538000,6.811000>0.250000 }
cylinder{<49.789000,0.038000,5.663000><49.789000,-1.538000,5.663000>0.250000 }
cylinder{<48.595500,0.038000,5.663500><48.595500,-1.538000,5.663500>0.250000 }
cylinder{<48.595500,0.038000,4.485000><48.595500,-1.538000,4.485000>0.250000 }
cylinder{<49.789500,0.038000,4.484500><49.789500,-1.538000,4.484500>0.250000 }
cylinder{<15.240000,0.038000,8.890000><15.240000,-1.538000,8.890000>0.300000 }
cylinder{<49.820000,0.038000,20.798000><49.820000,-1.538000,20.798000>0.250000 }
cylinder{<48.596000,0.038000,20.782500><48.596000,-1.538000,20.782500>0.250000 }
cylinder{<15.234000,0.038000,5.926000><15.234000,-1.538000,5.926000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<21.548700,0.000000,24.339100>}
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<22.548600,0.000000,24.339100>}
box{<0,0,-0.139700><0.999900,0.036000,0.139700> rotate<0,0.000000,0> translate<21.548700,0.000000,24.339100> }
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<26.592700,0.000000,24.316600>}
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<27.592600,0.000000,24.316600>}
box{<0,0,-0.139700><0.999900,0.036000,0.139700> rotate<0,0.000000,0> translate<26.592700,0.000000,24.316600> }
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<27.092600,0.000000,24.816600>}
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<27.092600,0.000000,23.816600>}
box{<0,0,-0.139700><1.000000,0.036000,0.139700> rotate<0,-90.000000,0> translate<27.092600,0.000000,23.816600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.835600,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.835600,0.000000,25.896800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<28.835600,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.835600,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.369400,0.000000,25.896800>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<28.835600,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.369400,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,25.718800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<29.369400,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.547400,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.369400,0.000000,25.185000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<29.369400,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.369400,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.835600,0.000000,25.185000>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<28.835600,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.191500,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,24.829100>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,44.997030,0> translate<29.191500,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.538700,0.000000,25.896800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<30.538700,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.538700,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.182800,0.000000,25.896800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<30.182800,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.182800,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.004900,0.000000,25.718800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<30.004900,0.000000,25.718800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.004900,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.004900,0.000000,25.007000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.004900,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.004900,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.182800,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<30.004900,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.182800,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.538700,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<30.182800,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.538700,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<30.538700,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<30.716700,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.360800,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<30.360800,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,25.896800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<31.174200,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.896800>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<31.174200,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.718800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<31.708000,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.540900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.886000,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.362900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<31.708000,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.185000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<31.708000,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.007000>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.886000,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,24.829100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<31.708000,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,24.829100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<31.174200,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.362900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<31.174200,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,25.896800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<32.877300,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,25.896800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<32.521400,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.718800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<32.343500,0.000000,25.718800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.540900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.343500,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,25.362900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,45.013128,0> translate<32.343500,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<32.521400,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.185000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<32.877300,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.007000>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.055300,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,24.829100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<32.877300,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<32.521400,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.007000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<32.343500,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.046600,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<33.690700,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.046600,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,25.362900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<34.046600,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,24.829100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.224600,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,24.829100>}
box{<0,0,-0.101600><0.533900,0.036000,0.101600> rotate<0,0.000000,0> translate<33.690700,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.512800,0.000000,25.007000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<33.512800,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.512800,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,25.185000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<33.512800,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,25.185000>}
box{<0,0,-0.101600><0.533900,0.036000,0.101600> rotate<0,0.000000,0> translate<33.690700,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.682100,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.682100,0.000000,24.829100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.682100,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.682100,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.215900,0.000000,24.829100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<34.682100,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.215900,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.393900,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<35.215900,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.393900,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.393900,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<35.393900,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.393900,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.215900,0.000000,25.540900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<35.215900,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.215900,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.682100,0.000000,25.540900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<34.682100,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.385200,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.029300,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<36.029300,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.029300,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.007000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<35.851400,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<35.851400,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.029300,0.000000,25.540900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<35.851400,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.029300,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.385200,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<36.029300,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.385200,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.563200,0.000000,25.362900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<36.385200,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.563200,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.563200,0.000000,25.185000>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.563200,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.563200,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.185000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<35.851400,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.020700,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.020700,0.000000,25.540900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<37.020700,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.020700,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.376600,0.000000,25.540900>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.020700,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.376600,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.554500,0.000000,25.540900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.376600,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.995100,0.000000,24.651200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.706900,0.000000,24.651200>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<37.995100,0.000000,24.651200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.876200,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.698200,0.000000,25.896800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<39.698200,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.698200,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.342300,0.000000,25.896800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<39.342300,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.342300,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.164400,0.000000,25.718800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<39.164400,0.000000,25.718800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.164400,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.164400,0.000000,25.007000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.164400,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.164400,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.342300,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<39.164400,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.342300,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.698200,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<39.342300,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.698200,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.876200,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<39.698200,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.511600,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.867500,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<40.511600,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.867500,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.045500,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<40.867500,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.045500,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.045500,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<41.045500,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.045500,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.867500,0.000000,25.540900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<40.867500,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.867500,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.511600,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<40.511600,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.511600,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.333700,0.000000,25.362900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<40.333700,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.333700,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.333700,0.000000,25.007000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.333700,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.333700,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.511600,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<40.333700,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.503000,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.503000,0.000000,25.540900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<41.503000,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.503000,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.036800,0.000000,25.540900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<41.503000,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.036800,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.214800,0.000000,25.362900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<42.036800,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.214800,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.214800,0.000000,24.829100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.214800,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.850200,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.850200,0.000000,25.007000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.850200,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.850200,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.028200,0.000000,24.829100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<42.850200,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.672300,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.028200,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<42.672300,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.451800,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.451800,0.000000,25.540900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<43.451800,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.451800,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.807700,0.000000,25.540900>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<43.451800,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.807700,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.985600,0.000000,25.540900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<43.807700,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.604100,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.960000,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<44.604100,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.960000,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.138000,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<44.960000,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.138000,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.138000,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<45.138000,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.138000,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.960000,0.000000,25.540900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<44.960000,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.960000,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.604100,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<44.604100,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.604100,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.426200,0.000000,25.362900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<44.426200,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.426200,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.426200,0.000000,25.007000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<44.426200,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.426200,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.604100,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<44.426200,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.595500,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.773400,0.000000,25.896800>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<45.595500,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.773400,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.773400,0.000000,24.829100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<45.773400,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.595500,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.951400,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<45.595500,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.544300,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.900200,0.000000,24.829100>}
box{<0,0,-0.101600><0.795817,0.036000,0.101600> rotate<0,63.430762,0> translate<47.544300,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.900200,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.256100,0.000000,25.540900>}
box{<0,0,-0.101600><0.795817,0.036000,0.101600> rotate<0,-63.430762,0> translate<47.900200,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.713600,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.069500,0.000000,25.896800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.713600,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.069500,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.069500,0.000000,24.829100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.069500,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.713600,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.425400,0.000000,24.829100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<48.713600,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.882900,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.882900,0.000000,25.007000>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,90.000000,0> translate<49.882900,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.882900,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.060800,0.000000,25.007000>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<49.882900,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.060800,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.060800,0.000000,24.829100>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.060800,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.060800,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.882900,0.000000,24.829100>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<49.882900,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.823400,0.000000,25.718800>}
box{<0,0,-0.101600><0.397931,0.036000,0.101600> rotate<0,-26.569737,0> translate<50.823400,0.000000,25.718800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.823400,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.362900>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<50.467500,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.007000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.467500,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.645400,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<50.467500,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.645400,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.001300,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<50.645400,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.001300,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<51.001300,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.185000>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.179300,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.001300,0.000000,25.362900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<51.001300,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.001300,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.362900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<50.467500,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.980100,0.000000,21.495900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.336000,0.000000,21.851800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<28.980100,0.000000,21.495900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.336000,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.336000,0.000000,20.784100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.336000,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.980100,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.691900,0.000000,20.784100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<28.980100,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.149400,0.000000,21.495900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.505300,0.000000,21.851800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.149400,0.000000,21.495900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.505300,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.505300,0.000000,20.784100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.505300,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.149400,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.861200,0.000000,20.784100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<30.149400,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.318700,0.000000,21.317900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.030500,0.000000,21.317900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<31.318700,0.000000,21.317900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.488000,0.000000,21.495900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.843900,0.000000,21.851800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.488000,0.000000,21.495900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.843900,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.843900,0.000000,20.784100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.843900,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.488000,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.199800,0.000000,20.784100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<32.488000,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.657300,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.369100,0.000000,21.851800>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<33.657300,0.000000,21.851800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.369100,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.369100,0.000000,21.673800>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.369100,0.000000,21.673800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.369100,0.000000,21.673800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.657300,0.000000,20.962000>}
box{<0,0,-0.101600><1.006637,0.036000,0.101600> rotate<0,-44.997030,0> translate<33.657300,0.000000,20.962000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.657300,0.000000,20.962000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.657300,0.000000,20.784100>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.657300,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.826600,0.000000,21.317900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.538400,0.000000,21.317900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<34.826600,0.000000,21.317900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.995900,0.000000,21.495900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.351800,0.000000,21.851800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.995900,0.000000,21.495900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.351800,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.351800,0.000000,20.784100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.351800,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.995900,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.707700,0.000000,20.784100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<35.995900,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,20.962000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,21.673800>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<37.165200,0.000000,21.673800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,21.673800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.343100,0.000000,21.851800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<37.165200,0.000000,21.673800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.343100,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.699000,0.000000,21.851800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.343100,0.000000,21.851800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.699000,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,21.673800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<37.699000,0.000000,21.851800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,21.673800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,20.962000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.877000,0.000000,20.962000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,20.962000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.699000,0.000000,20.784100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<37.699000,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.699000,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.343100,0.000000,20.784100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.343100,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.343100,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,20.962000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<37.165200,0.000000,20.962000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,20.962000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,21.673800>}
box{<0,0,-0.101600><1.006637,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.165200,0.000000,20.962000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927100,0.000000,17.623600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927100,0.000000,18.564200>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<4.927100,0.000000,18.564200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927100,0.000000,18.564200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.240600,0.000000,18.250600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<4.927100,0.000000,18.564200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.240600,0.000000,18.250600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554100,0.000000,18.564200>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<5.240600,0.000000,18.250600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554100,0.000000,18.564200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554100,0.000000,17.623600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.554100,0.000000,17.623600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,18.407400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,18.564200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<6.332900,0.000000,18.564200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,18.564200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,18.564200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.019300,0.000000,18.564200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,18.564200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,18.407400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<5.862600,0.000000,18.407400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,18.407400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,17.780300>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.862600,0.000000,17.780300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,17.780300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,17.623600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<5.862600,0.000000,17.780300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,17.623600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,17.623600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.019300,0.000000,17.623600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,17.623600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,17.780300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.332900,0.000000,17.623600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,18.564200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,17.623600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.798100,0.000000,17.623600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,17.623600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,17.623600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<6.798100,0.000000,17.623600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.733600,0.000000,17.623600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.733600,0.000000,18.564200>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<7.733600,0.000000,18.564200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.733600,0.000000,18.564200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.203900,0.000000,18.564200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<7.733600,0.000000,18.564200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.203900,0.000000,18.564200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.360600,0.000000,18.407400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<8.203900,0.000000,18.564200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.360600,0.000000,18.407400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.360600,0.000000,18.093900>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.360600,0.000000,18.093900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.360600,0.000000,18.093900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.203900,0.000000,17.937100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<8.203900,0.000000,17.937100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.203900,0.000000,17.937100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.733600,0.000000,17.937100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<7.733600,0.000000,17.937100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.047100,0.000000,17.937100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.360600,0.000000,17.623600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<8.047100,0.000000,17.937100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927100,0.000000,15.900200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927100,0.000000,15.273100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.927100,0.000000,15.273100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927100,0.000000,15.273100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.240600,0.000000,14.959600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<4.927100,0.000000,15.273100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.240600,0.000000,14.959600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554100,0.000000,15.273100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.240600,0.000000,14.959600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554100,0.000000,15.273100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554100,0.000000,15.900200>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<5.554100,0.000000,15.900200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,15.900200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,14.959600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.862600,0.000000,14.959600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,14.959600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,14.959600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<5.862600,0.000000,14.959600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,14.959600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,15.116300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.332900,0.000000,14.959600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,15.116300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,15.743400>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<6.489600,0.000000,15.743400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,15.743400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,15.900200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<6.332900,0.000000,15.900200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,15.900200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,15.900200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<5.862600,0.000000,15.900200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,15.900200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,14.959600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.798100,0.000000,14.959600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,14.959600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,14.959600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<6.798100,0.000000,14.959600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,14.959600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,15.116300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.268400,0.000000,14.959600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,15.116300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,15.743400>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<7.425100,0.000000,15.743400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,15.743400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,15.900200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<7.268400,0.000000,15.900200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,15.900200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,15.900200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<6.798100,0.000000,15.900200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927100,0.000000,13.381700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927100,0.000000,12.754600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.927100,0.000000,12.754600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927100,0.000000,12.754600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.240600,0.000000,12.441100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<4.927100,0.000000,12.754600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.240600,0.000000,12.441100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554100,0.000000,12.754600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.240600,0.000000,12.441100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554100,0.000000,12.754600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554100,0.000000,13.381700>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<5.554100,0.000000,13.381700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,13.224900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,13.381700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<6.332900,0.000000,13.381700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,13.381700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,13.381700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.019300,0.000000,13.381700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,13.381700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,13.224900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<5.862600,0.000000,13.224900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,13.224900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,13.068100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.862600,0.000000,13.068100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,13.068100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,12.911400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<5.862600,0.000000,13.068100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,12.911400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,12.911400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.019300,0.000000,12.911400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,12.911400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,12.754600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<6.332900,0.000000,12.911400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,12.754600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,12.597800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.489600,0.000000,12.597800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.489600,0.000000,12.597800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,12.441100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.332900,0.000000,12.441100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.332900,0.000000,12.441100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,12.441100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.019300,0.000000,12.441100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019300,0.000000,12.441100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.862600,0.000000,12.597800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<5.862600,0.000000,12.597800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,13.224900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,13.381700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<7.268400,0.000000,13.381700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,13.381700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954800,0.000000,13.381700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.954800,0.000000,13.381700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954800,0.000000,13.381700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,13.224900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<6.798100,0.000000,13.224900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,13.224900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,13.068100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.798100,0.000000,13.068100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,13.068100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954800,0.000000,12.911400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.798100,0.000000,13.068100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954800,0.000000,12.911400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,12.911400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.954800,0.000000,12.911400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,12.911400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,12.754600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<7.268400,0.000000,12.911400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,12.754600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,12.597800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.425100,0.000000,12.597800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425100,0.000000,12.597800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,12.441100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.268400,0.000000,12.441100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,12.441100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954800,0.000000,12.441100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.954800,0.000000,12.441100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954800,0.000000,12.441100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,12.597800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.798100,0.000000,12.597800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927600,0.000000,10.025100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927600,0.000000,10.965700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<4.927600,0.000000,10.965700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927600,0.000000,10.965700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.397900,0.000000,10.965700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<4.927600,0.000000,10.965700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.397900,0.000000,10.965700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554600,0.000000,10.808900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<5.397900,0.000000,10.965700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554600,0.000000,10.808900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554600,0.000000,10.495400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.554600,0.000000,10.495400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554600,0.000000,10.495400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.397900,0.000000,10.338600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<5.397900,0.000000,10.338600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.397900,0.000000,10.338600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927600,0.000000,10.338600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<4.927600,0.000000,10.338600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,10.808900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.333400,0.000000,10.965700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<6.333400,0.000000,10.965700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.333400,0.000000,10.965700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019800,0.000000,10.965700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.019800,0.000000,10.965700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019800,0.000000,10.965700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.863100,0.000000,10.808900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<5.863100,0.000000,10.808900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.863100,0.000000,10.808900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.863100,0.000000,10.181800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.863100,0.000000,10.181800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.863100,0.000000,10.181800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019800,0.000000,10.025100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<5.863100,0.000000,10.181800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019800,0.000000,10.025100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.333400,0.000000,10.025100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.019800,0.000000,10.025100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.333400,0.000000,10.025100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,10.181800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.333400,0.000000,10.025100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,10.181800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,10.495400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<6.490100,0.000000,10.495400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,10.495400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.176600,0.000000,10.495400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<6.176600,0.000000,10.495400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798600,0.000000,10.965700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798600,0.000000,10.025100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.798600,0.000000,10.025100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798600,0.000000,10.025100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268900,0.000000,10.025100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<6.798600,0.000000,10.025100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268900,0.000000,10.025100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425600,0.000000,10.181800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.268900,0.000000,10.025100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425600,0.000000,10.181800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425600,0.000000,10.808900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<7.425600,0.000000,10.808900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425600,0.000000,10.808900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268900,0.000000,10.965700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<7.268900,0.000000,10.965700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268900,0.000000,10.965700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798600,0.000000,10.965700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<6.798600,0.000000,10.965700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927600,0.000000,7.509600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927600,0.000000,8.450200>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<4.927600,0.000000,8.450200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927600,0.000000,8.450200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.397900,0.000000,8.450200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<4.927600,0.000000,8.450200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.397900,0.000000,8.450200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554600,0.000000,8.293400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<5.397900,0.000000,8.450200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554600,0.000000,8.293400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554600,0.000000,7.979900>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.554600,0.000000,7.979900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.554600,0.000000,7.979900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.397900,0.000000,7.823100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<5.397900,0.000000,7.823100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.397900,0.000000,7.823100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.927600,0.000000,7.823100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<4.927600,0.000000,7.823100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,8.293400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.333400,0.000000,8.450200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<6.333400,0.000000,8.450200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.333400,0.000000,8.450200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019800,0.000000,8.450200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.019800,0.000000,8.450200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019800,0.000000,8.450200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.863100,0.000000,8.293400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<5.863100,0.000000,8.293400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.863100,0.000000,8.293400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.863100,0.000000,7.666300>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.863100,0.000000,7.666300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.863100,0.000000,7.666300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019800,0.000000,7.509600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<5.863100,0.000000,7.666300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.019800,0.000000,7.509600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.333400,0.000000,7.509600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.019800,0.000000,7.509600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.333400,0.000000,7.509600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,7.666300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.333400,0.000000,7.509600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,7.666300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,7.979900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<6.490100,0.000000,7.979900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.490100,0.000000,7.979900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.176600,0.000000,7.979900>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<6.176600,0.000000,7.979900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425600,0.000000,8.293400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268900,0.000000,8.450200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<7.268900,0.000000,8.450200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268900,0.000000,8.450200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.955300,0.000000,8.450200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.955300,0.000000,8.450200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.955300,0.000000,8.450200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798600,0.000000,8.293400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<6.798600,0.000000,8.293400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798600,0.000000,8.293400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798600,0.000000,7.666300>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.798600,0.000000,7.666300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798600,0.000000,7.666300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.955300,0.000000,7.509600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.798600,0.000000,7.666300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.955300,0.000000,7.509600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268900,0.000000,7.509600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.955300,0.000000,7.509600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268900,0.000000,7.509600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425600,0.000000,7.666300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.268900,0.000000,7.509600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,9.065600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,10.133300>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<58.711300,0.000000,10.133300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,10.133300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,10.133300>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.711300,0.000000,10.133300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,10.133300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.955300>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<59.245100,0.000000,10.133300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.955300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.777400>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.423100,0.000000,9.777400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.777400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.599400>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.245100,0.000000,9.599400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.599400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.421500>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<59.245100,0.000000,9.599400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.421500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.243500>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.423100,0.000000,9.243500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.243500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.065600>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<59.245100,0.000000,9.065600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.065600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,9.065600>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.711300,0.000000,9.065600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,9.599400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.599400>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.711300,0.000000,9.599400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,12.401800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152600,0.000000,12.579800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<59.152600,0.000000,12.579800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152600,0.000000,12.579800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.796700,0.000000,12.579800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<58.796700,0.000000,12.579800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.796700,0.000000,12.579800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618800,0.000000,12.401800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<58.618800,0.000000,12.401800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618800,0.000000,12.401800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618800,0.000000,11.690000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<58.618800,0.000000,11.690000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618800,0.000000,11.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.796700,0.000000,11.512100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<58.618800,0.000000,11.690000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.796700,0.000000,11.512100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152600,0.000000,11.512100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<58.796700,0.000000,11.512100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152600,0.000000,11.512100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,11.690000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<59.152600,0.000000,11.512100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,11.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,12.045900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<59.330600,0.000000,12.045900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,12.045900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.974700,0.000000,12.045900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<58.974700,0.000000,12.045900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.691800,0.000000,16.998900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.403600,0.000000,16.998900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.691800,0.000000,16.998900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618300,0.000000,14.125600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618300,0.000000,15.193300>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<58.618300,0.000000,15.193300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618300,0.000000,15.193300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152100,0.000000,15.193300>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.618300,0.000000,15.193300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152100,0.000000,15.193300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,15.015300>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<59.152100,0.000000,15.193300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,15.015300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,14.659400>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.330100,0.000000,14.659400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,14.659400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152100,0.000000,14.481500>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<59.152100,0.000000,14.481500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152100,0.000000,14.481500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618300,0.000000,14.481500>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.618300,0.000000,14.481500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.974200,0.000000,14.481500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,14.125600>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,44.997030,0> translate<58.974200,0.000000,14.481500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.548300,0.000000,23.516400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.327800,0.000000,23.516400>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<7.548300,0.000000,23.516400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.544800,0.000000,20.898400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.324300,0.000000,20.898400>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<7.544800,0.000000,20.898400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.934500,0.000000,21.288200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.934500,0.000000,20.508600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.934500,0.000000,20.508600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.394600,0.000000,17.816600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.767600,0.000000,17.816600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<15.767600,0.000000,17.816600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.767600,0.000000,17.816600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.394600,0.000000,18.443600>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.767600,0.000000,17.816600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.394600,0.000000,18.443600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.394600,0.000000,18.600400>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<16.394600,0.000000,18.600400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.394600,0.000000,18.600400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.237900,0.000000,18.757200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<16.237900,0.000000,18.757200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.237900,0.000000,18.757200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.924300,0.000000,18.757200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<15.924300,0.000000,18.757200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.924300,0.000000,18.757200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.767600,0.000000,18.600400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<15.767600,0.000000,18.600400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.572100,0.000000,18.466600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.885600,0.000000,18.780200>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<17.572100,0.000000,18.466600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.885600,0.000000,18.780200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.885600,0.000000,17.839600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.885600,0.000000,17.839600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.572100,0.000000,17.839600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.199100,0.000000,17.839600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<17.572100,0.000000,17.839600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.940100,0.000000,18.600400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.096800,0.000000,18.757200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<13.940100,0.000000,18.600400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.096800,0.000000,18.757200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.410400,0.000000,18.757200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<14.096800,0.000000,18.757200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.410400,0.000000,18.757200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.567100,0.000000,18.600400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<14.410400,0.000000,18.757200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.567100,0.000000,18.600400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.567100,0.000000,18.443600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.567100,0.000000,18.443600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.567100,0.000000,18.443600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.410400,0.000000,18.286900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.410400,0.000000,18.286900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.410400,0.000000,18.286900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.253600,0.000000,18.286900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<14.253600,0.000000,18.286900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.410400,0.000000,18.286900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.567100,0.000000,18.130100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<14.410400,0.000000,18.286900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.567100,0.000000,18.130100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.567100,0.000000,17.973300>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.567100,0.000000,17.973300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.567100,0.000000,17.973300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.410400,0.000000,17.816600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.410400,0.000000,17.816600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.410400,0.000000,17.816600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.096800,0.000000,17.816600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<14.096800,0.000000,17.816600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.096800,0.000000,17.816600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.940100,0.000000,17.973300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<13.940100,0.000000,17.973300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583400,0.000000,17.816600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583400,0.000000,18.757200>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<12.583400,0.000000,18.757200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583400,0.000000,18.757200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.113100,0.000000,18.286900>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.113100,0.000000,18.286900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.113100,0.000000,18.286900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.740100,0.000000,18.286900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<12.113100,0.000000,18.286900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.982100,0.000000,18.757200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.355100,0.000000,18.757200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<10.355100,0.000000,18.757200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.355100,0.000000,18.757200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.355100,0.000000,18.286900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.355100,0.000000,18.286900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.355100,0.000000,18.286900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.668600,0.000000,18.443600>}
box{<0,0,-0.038100><0.350481,0.036000,0.038100> rotate<0,-26.555988,0> translate<10.355100,0.000000,18.286900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.668600,0.000000,18.443600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.825400,0.000000,18.443600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<10.668600,0.000000,18.443600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.825400,0.000000,18.443600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.982100,0.000000,18.286900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<10.825400,0.000000,18.443600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.982100,0.000000,18.286900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.982100,0.000000,17.973300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.982100,0.000000,17.973300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.982100,0.000000,17.973300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.825400,0.000000,17.816600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.825400,0.000000,17.816600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.825400,0.000000,17.816600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.511800,0.000000,17.816600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<10.511800,0.000000,17.816600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.511800,0.000000,17.816600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.355100,0.000000,17.973300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<10.355100,0.000000,17.973300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.953100,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.953100,0.000000,23.944800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<28.953100,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.953100,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.664900,0.000000,22.877100>}
box{<0,0,-0.101600><1.283216,0.036000,0.101600> rotate<0,56.306216,0> translate<28.953100,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.664900,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.664900,0.000000,23.944800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<29.664900,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,23.944800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<30.122400,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.944800>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<30.122400,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.766800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<30.656200,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.766800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.588900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.834200,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.410900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.656200,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.233000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<30.656200,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.233000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.055000>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.834200,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,22.877100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<30.656200,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,22.877100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<30.122400,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.410900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<30.122400,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.291700,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,23.588900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<31.291700,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,22.877100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.469600,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.291700,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.647600,0.000000,22.877100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<31.291700,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,24.122700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,23.944800>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.469600,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.249100,0.000000,23.766800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.249100,0.000000,23.055000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.249100,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.249100,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.427100,0.000000,22.877100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<32.249100,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.071200,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.427100,0.000000,23.588900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<32.071200,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.850700,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.850700,0.000000,22.877100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.850700,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.850700,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.206600,0.000000,23.233000>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.850700,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.206600,0.000000,23.233000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.562500,0.000000,22.877100>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,44.997030,0> translate<33.206600,0.000000,23.233000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.562500,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.562500,0.000000,23.944800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<33.562500,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.197900,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.553800,0.000000,22.877100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<34.197900,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.553800,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.731800,0.000000,23.055000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<34.553800,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.731800,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.731800,0.000000,23.410900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<34.731800,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.731800,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.553800,0.000000,23.588900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<34.553800,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.553800,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.197900,0.000000,23.588900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<34.197900,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.197900,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,23.410900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<34.020000,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,23.055000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.020000,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.197900,0.000000,22.877100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<34.020000,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.189300,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.189300,0.000000,23.588900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<35.189300,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.189300,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.723100,0.000000,23.588900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<35.189300,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.723100,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.901100,0.000000,23.410900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<35.723100,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.901100,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.901100,0.000000,22.877100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.901100,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.070400,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.070400,0.000000,22.877100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.070400,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.070400,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.536500,0.000000,22.877100>}
box{<0,0,-0.101600><0.533900,0.036000,0.101600> rotate<0,0.000000,0> translate<36.536500,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.536500,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.358600,0.000000,23.055000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<36.358600,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.358600,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.358600,0.000000,23.410900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<36.358600,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.358600,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.536500,0.000000,23.588900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<36.358600,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.536500,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.070400,0.000000,23.588900>}
box{<0,0,-0.101600><0.533900,0.036000,0.101600> rotate<0,0.000000,0> translate<36.536500,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.061700,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.705800,0.000000,22.877100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.705800,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.705800,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.055000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<37.527900,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.410900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<37.527900,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.705800,0.000000,23.588900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<37.527900,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.705800,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.061700,0.000000,23.588900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.705800,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.061700,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.239700,0.000000,23.410900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<38.061700,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.239700,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.239700,0.000000,23.233000>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.239700,0.000000,23.233000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.239700,0.000000,23.233000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.233000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<37.527900,0.000000,23.233000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.697200,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.697200,0.000000,23.588900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<38.697200,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.697200,0.000000,23.233000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.053100,0.000000,23.588900>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<38.697200,0.000000,23.233000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.053100,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.231000,0.000000,23.588900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<39.053100,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.718600,0.000000,4.141600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,3.984900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<18.561800,0.000000,3.984900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,3.984900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,3.671300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.561800,0.000000,3.671300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,3.671300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.718600,0.000000,3.514600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<18.561800,0.000000,3.671300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.718600,0.000000,3.514600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.345700,0.000000,3.514600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<18.718600,0.000000,3.514600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.345700,0.000000,3.514600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,3.671300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.345700,0.000000,3.514600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,3.671300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,3.984900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<19.502400,0.000000,3.984900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,3.984900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.345700,0.000000,4.141600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<19.345700,0.000000,4.141600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.345700,0.000000,4.141600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.032100,0.000000,4.141600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<19.032100,0.000000,4.141600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.032100,0.000000,4.141600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.032100,0.000000,3.828100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.032100,0.000000,3.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,4.450100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,4.450100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<18.561800,0.000000,4.450100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,4.450100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,5.077100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<18.561800,0.000000,4.450100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,5.077100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,5.077100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<18.561800,0.000000,5.077100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,5.385600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,5.385600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<18.561800,0.000000,5.385600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,5.385600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,5.855900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<19.502400,0.000000,5.855900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.502400,0.000000,5.855900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.345700,0.000000,6.012600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<19.345700,0.000000,6.012600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.345700,0.000000,6.012600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.718600,0.000000,6.012600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<18.718600,0.000000,6.012600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.718600,0.000000,6.012600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,5.855900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<18.561800,0.000000,5.855900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,5.855900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.561800,0.000000,5.385600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.561800,0.000000,5.385600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.402100,0.000000,4.005100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,3.848400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<26.245300,0.000000,3.848400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,3.848400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,3.534800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.245300,0.000000,3.534800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,3.534800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.402100,0.000000,3.378100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<26.245300,0.000000,3.534800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.402100,0.000000,3.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.029200,0.000000,3.378100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<26.402100,0.000000,3.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.029200,0.000000,3.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,3.534800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.029200,0.000000,3.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,3.534800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,3.848400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<27.185900,0.000000,3.848400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,3.848400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.029200,0.000000,4.005100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<27.029200,0.000000,4.005100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.029200,0.000000,4.005100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.715600,0.000000,4.005100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<26.715600,0.000000,4.005100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.715600,0.000000,4.005100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.715600,0.000000,3.691600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.715600,0.000000,3.691600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,4.313600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,4.313600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<26.245300,0.000000,4.313600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,4.313600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,4.940600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<26.245300,0.000000,4.313600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,4.940600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,4.940600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<26.245300,0.000000,4.940600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,5.249100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,5.249100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<26.245300,0.000000,5.249100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,5.249100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,5.719400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<27.185900,0.000000,5.719400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.185900,0.000000,5.719400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.029200,0.000000,5.876100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<27.029200,0.000000,5.876100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.029200,0.000000,5.876100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.402100,0.000000,5.876100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<26.402100,0.000000,5.876100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.402100,0.000000,5.876100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,5.719400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<26.245300,0.000000,5.719400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,5.719400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245300,0.000000,5.249100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.245300,0.000000,5.249100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,3.484600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,3.484600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.319300,0.000000,3.484600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,3.484600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,3.798100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.946400,0.000000,3.484600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,3.798100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,4.111600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<21.946400,0.000000,4.111600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,4.111600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.111600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.319300,0.000000,4.111600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.047100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.890400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<21.319300,0.000000,4.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.576800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.319300,0.000000,4.576800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.576800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,4.420100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<21.319300,0.000000,4.576800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,4.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,4.420100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.476100,0.000000,4.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,4.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.576800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.103200,0.000000,4.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.576800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.890400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<22.259900,0.000000,4.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.047100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<22.103200,0.000000,5.047100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.982600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.825900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<21.319300,0.000000,5.825900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.825900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.512300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.319300,0.000000,5.512300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.512300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.355600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<21.319300,0.000000,5.512300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.355600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.355600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.476100,0.000000,5.355600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.355600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.512300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.103200,0.000000,5.355600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.512300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.825900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<22.259900,0.000000,5.825900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.825900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.982600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<22.103200,0.000000,5.982600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.631900,0.000000,3.425100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,3.425100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.691300,0.000000,3.425100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,3.425100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,3.895400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<23.691300,0.000000,3.895400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,3.895400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.848100,0.000000,4.052100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<23.691300,0.000000,3.895400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.848100,0.000000,4.052100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.161600,0.000000,4.052100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<23.848100,0.000000,4.052100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.161600,0.000000,4.052100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.318400,0.000000,3.895400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<24.161600,0.000000,4.052100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.318400,0.000000,3.895400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.318400,0.000000,3.425100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.318400,0.000000,3.425100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,4.830900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,4.517300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.691300,0.000000,4.517300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,4.517300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.848100,0.000000,4.360600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<23.691300,0.000000,4.517300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.848100,0.000000,4.360600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.475200,0.000000,4.360600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<23.848100,0.000000,4.360600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.475200,0.000000,4.360600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.631900,0.000000,4.517300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.475200,0.000000,4.360600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.631900,0.000000,4.517300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.631900,0.000000,4.830900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<24.631900,0.000000,4.830900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.631900,0.000000,4.830900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.475200,0.000000,4.987600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<24.475200,0.000000,4.987600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.475200,0.000000,4.987600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.848100,0.000000,4.987600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<23.848100,0.000000,4.987600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.848100,0.000000,4.987600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,4.830900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<23.691300,0.000000,4.830900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.631900,0.000000,5.609600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,5.609600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.691300,0.000000,5.609600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,5.296100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.691300,0.000000,5.923100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<23.691300,0.000000,5.923100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.672900,0.000000,3.395600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,3.395600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.732300,0.000000,3.395600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,3.395600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,3.865900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<28.732300,0.000000,3.865900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,3.865900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.889100,0.000000,4.022600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<28.732300,0.000000,3.865900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.889100,0.000000,4.022600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.202600,0.000000,4.022600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<28.889100,0.000000,4.022600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.202600,0.000000,4.022600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.359400,0.000000,3.865900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<29.202600,0.000000,4.022600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.359400,0.000000,3.865900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.359400,0.000000,3.395600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.359400,0.000000,3.395600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.672900,0.000000,4.331100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,4.331100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.732300,0.000000,4.331100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,4.331100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,4.801400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<28.732300,0.000000,4.801400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,4.801400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.889100,0.000000,4.958100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<28.732300,0.000000,4.801400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.889100,0.000000,4.958100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.045900,0.000000,4.958100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.889100,0.000000,4.958100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.045900,0.000000,4.958100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.202600,0.000000,4.801400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.045900,0.000000,4.958100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.202600,0.000000,4.801400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.359400,0.000000,4.958100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<29.202600,0.000000,4.801400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.359400,0.000000,4.958100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516200,0.000000,4.958100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.359400,0.000000,4.958100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516200,0.000000,4.958100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.672900,0.000000,4.801400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.516200,0.000000,4.958100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.672900,0.000000,4.801400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.672900,0.000000,4.331100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.672900,0.000000,4.331100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.202600,0.000000,4.331100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.202600,0.000000,4.801400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<29.202600,0.000000,4.801400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516200,0.000000,5.266600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.889100,0.000000,5.266600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<28.889100,0.000000,5.266600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.889100,0.000000,5.266600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,5.423300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<28.732300,0.000000,5.423300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,5.423300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,5.736900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<28.732300,0.000000,5.736900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.732300,0.000000,5.736900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.889100,0.000000,5.893600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<28.732300,0.000000,5.736900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.889100,0.000000,5.893600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516200,0.000000,5.893600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<28.889100,0.000000,5.893600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516200,0.000000,5.893600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.672900,0.000000,5.736900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.516200,0.000000,5.893600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.672900,0.000000,5.736900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.672900,0.000000,5.423300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.672900,0.000000,5.423300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.672900,0.000000,5.423300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516200,0.000000,5.266600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.516200,0.000000,5.266600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516200,0.000000,5.266600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.889100,0.000000,5.893600>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<28.889100,0.000000,5.893600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,3.484600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,3.484600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.319300,0.000000,3.484600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,3.484600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,3.798100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.946400,0.000000,3.484600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,3.798100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,4.111600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<21.946400,0.000000,4.111600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,4.111600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.111600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.319300,0.000000,4.111600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.047100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.890400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<21.319300,0.000000,4.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.576800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.319300,0.000000,4.576800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.576800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,4.420100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<21.319300,0.000000,4.576800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,4.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,4.420100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.476100,0.000000,4.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,4.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.576800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.103200,0.000000,4.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.576800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.890400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<22.259900,0.000000,4.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.047100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<22.103200,0.000000,5.047100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.982600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.825900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<21.319300,0.000000,5.825900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.825900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.512300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.319300,0.000000,5.512300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.512300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.355600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<21.319300,0.000000,5.512300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.355600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.355600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.476100,0.000000,5.355600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.355600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.512300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.103200,0.000000,5.355600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.512300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.825900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<22.259900,0.000000,5.825900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.825900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.982600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<22.103200,0.000000,5.982600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,3.484600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.106400,0.000000,3.484600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<31.479300,0.000000,3.484600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.106400,0.000000,3.484600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,3.798100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.106400,0.000000,3.484600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,3.798100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.106400,0.000000,4.111600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<32.106400,0.000000,4.111600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.106400,0.000000,4.111600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,4.111600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<31.479300,0.000000,4.111600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.636100,0.000000,5.047100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,4.890400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<31.479300,0.000000,4.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,4.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,4.576800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.479300,0.000000,4.576800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,4.576800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.636100,0.000000,4.420100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<31.479300,0.000000,4.576800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.636100,0.000000,4.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.263200,0.000000,4.420100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<31.636100,0.000000,4.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.263200,0.000000,4.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,4.576800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.263200,0.000000,4.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,4.576800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,4.890400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<32.419900,0.000000,4.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,4.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.263200,0.000000,5.047100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.263200,0.000000,5.047100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.636100,0.000000,5.982600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,5.825900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<31.479300,0.000000,5.825900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,5.825900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,5.512300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.479300,0.000000,5.512300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.479300,0.000000,5.512300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.636100,0.000000,5.355600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<31.479300,0.000000,5.512300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.636100,0.000000,5.355600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.263200,0.000000,5.355600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<31.636100,0.000000,5.355600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.263200,0.000000,5.355600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,5.512300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.263200,0.000000,5.355600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,5.512300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,5.825900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<32.419900,0.000000,5.825900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.419900,0.000000,5.825900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.263200,0.000000,5.982600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.263200,0.000000,5.982600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.777900,0.000000,3.401100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,3.401100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.837300,0.000000,3.401100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,3.401100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,3.871400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<33.837300,0.000000,3.871400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,3.871400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.994100,0.000000,4.028100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<33.837300,0.000000,3.871400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.994100,0.000000,4.028100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.307600,0.000000,4.028100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<33.994100,0.000000,4.028100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.307600,0.000000,4.028100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.464400,0.000000,3.871400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.307600,0.000000,4.028100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.464400,0.000000,3.871400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.464400,0.000000,3.401100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.464400,0.000000,3.401100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.464400,0.000000,3.714600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.777900,0.000000,4.028100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.464400,0.000000,3.714600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,4.963600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,4.336600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.837300,0.000000,4.336600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,4.336600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.777900,0.000000,4.336600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.837300,0.000000,4.336600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.777900,0.000000,4.336600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.777900,0.000000,4.963600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<34.777900,0.000000,4.963600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.307600,0.000000,4.336600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.307600,0.000000,4.650100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<34.307600,0.000000,4.650100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,5.272100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.777900,0.000000,5.272100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.837300,0.000000,5.272100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.777900,0.000000,5.272100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.777900,0.000000,5.742400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<34.777900,0.000000,5.742400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.777900,0.000000,5.742400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.621200,0.000000,5.899100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.621200,0.000000,5.899100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.621200,0.000000,5.899100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.994100,0.000000,5.899100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<33.994100,0.000000,5.899100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.994100,0.000000,5.899100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,5.742400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<33.837300,0.000000,5.742400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,5.742400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.837300,0.000000,5.272100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.837300,0.000000,5.272100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.489600,0.000000,4.003600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,3.846900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<36.332800,0.000000,3.846900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,3.846900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,3.533300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.332800,0.000000,3.533300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,3.533300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.489600,0.000000,3.376600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<36.332800,0.000000,3.533300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.489600,0.000000,3.376600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.116700,0.000000,3.376600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<36.489600,0.000000,3.376600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.116700,0.000000,3.376600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.273400,0.000000,3.533300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.116700,0.000000,3.376600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.273400,0.000000,3.533300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.273400,0.000000,3.846900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<37.273400,0.000000,3.846900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.273400,0.000000,3.846900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.116700,0.000000,4.003600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.116700,0.000000,4.003600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.116700,0.000000,4.003600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.803100,0.000000,4.003600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.803100,0.000000,4.003600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.803100,0.000000,4.003600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.803100,0.000000,3.690100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.803100,0.000000,3.690100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.273400,0.000000,4.312100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,4.312100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.332800,0.000000,4.312100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,4.312100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,4.782400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<36.332800,0.000000,4.782400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,4.782400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.489600,0.000000,4.939100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<36.332800,0.000000,4.782400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.489600,0.000000,4.939100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.803100,0.000000,4.939100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<36.489600,0.000000,4.939100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.803100,0.000000,4.939100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.959900,0.000000,4.782400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<36.803100,0.000000,4.939100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.959900,0.000000,4.782400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.959900,0.000000,4.312100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.959900,0.000000,4.312100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.959900,0.000000,4.625600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.273400,0.000000,4.939100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.959900,0.000000,4.625600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.273400,0.000000,5.247600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,5.247600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.332800,0.000000,5.247600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,5.247600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.273400,0.000000,5.874600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<36.332800,0.000000,5.247600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.273400,0.000000,5.874600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.332800,0.000000,5.874600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.332800,0.000000,5.874600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,3.450600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.853300,0.000000,3.450600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<38.853300,0.000000,3.450600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.853300,0.000000,3.450600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.853300,0.000000,3.920900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<38.853300,0.000000,3.920900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.853300,0.000000,3.920900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.010100,0.000000,4.077600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<38.853300,0.000000,3.920900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.010100,0.000000,4.077600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.166900,0.000000,4.077600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<39.010100,0.000000,4.077600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.166900,0.000000,4.077600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.323600,0.000000,3.920900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<39.166900,0.000000,4.077600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.323600,0.000000,3.920900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.480400,0.000000,4.077600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<39.323600,0.000000,3.920900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.480400,0.000000,4.077600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.637200,0.000000,4.077600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<39.480400,0.000000,4.077600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.637200,0.000000,4.077600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,3.920900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<39.637200,0.000000,4.077600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,3.920900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,3.450600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.793900,0.000000,3.450600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.323600,0.000000,3.450600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.323600,0.000000,3.920900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<39.323600,0.000000,3.920900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.853300,0.000000,4.386100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,4.386100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<38.853300,0.000000,4.386100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,4.386100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,5.013100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<39.793900,0.000000,5.013100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.853300,0.000000,5.321600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.637200,0.000000,5.321600>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<38.853300,0.000000,5.321600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.637200,0.000000,5.321600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,5.478300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.637200,0.000000,5.321600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,5.478300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,5.791900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<39.793900,0.000000,5.791900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.793900,0.000000,5.791900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.637200,0.000000,5.948600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<39.637200,0.000000,5.948600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.637200,0.000000,5.948600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.853300,0.000000,5.948600>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<38.853300,0.000000,5.948600> }
//BATT silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,24.120000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,22.850000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.159000,0.000000,22.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,22.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,22.215000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<6.524000,0.000000,22.215000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,22.215000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,22.850000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.619000,0.000000,22.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,22.215000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,21.580000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<6.524000,0.000000,22.215000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,21.580000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,20.310000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.159000,0.000000,20.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,20.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,19.675000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<6.524000,0.000000,19.675000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,19.675000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,20.310000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.619000,0.000000,20.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,20.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,21.580000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.619000,0.000000,21.580000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,21.580000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,22.215000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.619000,0.000000,21.580000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,24.755000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,24.755000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.254000,0.000000,24.755000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,24.120000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,24.755000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<6.524000,0.000000,24.755000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,24.755000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,24.120000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.619000,0.000000,24.120000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,22.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,24.120000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.619000,0.000000,24.120000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,19.675000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,19.675000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.254000,0.000000,19.675000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<5.889000,0.000000,20.945000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<5.889000,0.000000,23.485000>}
//BLUE silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,8.838000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,8.838000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,8.838000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,8.838000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,2.338000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.526000,0.000000,2.338000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,2.338000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,2.338000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,2.338000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,2.338000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,8.838000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.026000,0.000000,8.838000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,3.048000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.546000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,3.048000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,8.128000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.006000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,8.128000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,8.128000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.980500,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.913700,0.000000,22.428500>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<24.913700,0.000000,22.428500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.913700,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.913700,0.000000,21.666500>}
box{<0,0,-0.203200><0.762000,0.036000,0.203200> rotate<0,-90.000000,0> translate<24.913700,0.000000,21.666500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.913700,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.913700,0.000000,23.190500>}
box{<0,0,-0.203200><0.762000,0.036000,0.203200> rotate<0,90.000000,0> translate<24.913700,0.000000,23.190500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.024700,0.000000,21.666500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.024700,0.000000,22.428500>}
box{<0,0,-0.203200><0.762000,0.036000,0.203200> rotate<0,90.000000,0> translate<24.024700,0.000000,22.428500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.024700,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.932500,0.000000,22.428500>}
box{<0,0,-0.076200><1.092200,0.036000,0.076200> rotate<0,0.000000,0> translate<22.932500,0.000000,22.428500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.024700,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.024700,0.000000,23.190500>}
box{<0,0,-0.203200><0.762000,0.036000,0.203200> rotate<0,90.000000,0> translate<24.024700,0.000000,23.190500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.139500,0.000000,18.999500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.139500,0.000000,25.857500>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.139500,0.000000,25.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.885500,0.000000,26.111500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.027500,0.000000,26.111500>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.027500,0.000000,26.111500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.773500,0.000000,25.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.773500,0.000000,18.999500>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.773500,0.000000,18.999500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.027500,0.000000,18.745500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.885500,0.000000,18.745500>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.027500,0.000000,18.745500> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.027500,0.000000,18.999500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.027500,0.000000,25.857500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<27.885500,0.000000,25.857500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<27.885500,0.000000,18.999500>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.970000,0.000000,8.936000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.970000,0.000000,8.336000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.970000,0.000000,8.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.770000,0.000000,8.936000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.770000,0.000000,8.336000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.770000,0.000000,8.336000> }
//GREEN silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,16.458000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,16.458000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,16.458000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,16.458000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,9.958000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.526000,0.000000,9.958000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,9.958000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,9.958000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,9.958000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,9.958000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,16.458000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.026000,0.000000,16.458000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,10.668000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.546000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,10.668000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,15.748000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.006000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,15.748000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,15.748000> }
//LUX silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,10.214000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,8.944000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.453000,0.000000,8.944000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,8.944000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,8.309000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<61.818000,0.000000,8.309000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,8.309000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,8.944000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<59.913000,0.000000,8.944000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,13.389000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,12.754000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<61.818000,0.000000,13.389000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,12.754000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,11.484000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.453000,0.000000,11.484000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,11.484000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,10.849000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<61.818000,0.000000,10.849000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,10.849000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,11.484000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<59.913000,0.000000,11.484000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,11.484000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,12.754000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.913000,0.000000,12.754000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,12.754000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,13.389000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.913000,0.000000,12.754000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,10.214000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,10.849000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<61.818000,0.000000,10.849000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,10.849000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,10.214000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.913000,0.000000,10.214000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,8.944000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,10.214000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.913000,0.000000,10.214000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,17.834000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,16.564000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.453000,0.000000,16.564000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,16.564000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,15.929000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<61.818000,0.000000,15.929000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,15.929000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,16.564000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<59.913000,0.000000,16.564000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,15.929000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,15.294000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<61.818000,0.000000,15.929000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,15.294000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,14.024000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.453000,0.000000,14.024000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,14.024000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,13.389000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<61.818000,0.000000,13.389000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,13.389000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,14.024000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<59.913000,0.000000,14.024000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,14.024000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,15.294000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.913000,0.000000,15.294000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,15.294000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,15.929000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.913000,0.000000,15.294000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,18.469000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,18.469000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<60.548000,0.000000,18.469000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,17.834000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,18.469000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<61.818000,0.000000,18.469000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,18.469000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,17.834000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.913000,0.000000,17.834000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,16.564000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,17.834000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.913000,0.000000,17.834000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,8.309000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,8.309000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<60.548000,0.000000,8.309000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.183000,0.000000,9.579000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.183000,0.000000,12.119000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.183000,0.000000,14.659000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.183000,0.000000,17.199000>}
//PERIPH silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.677000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.677000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.582000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<34.947000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.582000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.947000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.502000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.137000,0.000000,3.091500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.502000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.137000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.137000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<32.407000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.407000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.137000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.137000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.137000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.502000,0.000000,1.186500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<30.502000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.677000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<33.042000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.677000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<33.042000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.677000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.677000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.057000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.327000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.057000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.327000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.962000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.327000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.962000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.327000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.327000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.962000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.597000,0.000000,3.091500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.962000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.597000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.867000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.597000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.867000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.502000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.867000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.502000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.867000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.867000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.867000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.597000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.597000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.597000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.962000,0.000000,1.186500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.962000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.882000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.517000,0.000000,3.091500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.882000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.517000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.787000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.517000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.787000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.422000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.787000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.422000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.787000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.787000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.787000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.517000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.517000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.517000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.882000,0.000000,1.186500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.882000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.057000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.422000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<25.422000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.422000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.057000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<25.422000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.327000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.057000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.057000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.437000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.707000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.437000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.707000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.342000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.707000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.342000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.707000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.707000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.342000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.977000,0.000000,3.091500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.342000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.977000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.247000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.977000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.247000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.882000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.247000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.882000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.247000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.247000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.247000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.977000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.977000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.977000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.342000,0.000000,1.186500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.342000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.802000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.802000,0.000000,1.186500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.802000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.437000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.802000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.802000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.802000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.437000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.802000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.707000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.437000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.437000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.217000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.487000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.217000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.487000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.122000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<37.487000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.122000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.487000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.487000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.217000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.582000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.582000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.582000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.217000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<35.582000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.487000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.217000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.217000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.757000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.027000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.757000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.027000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.662000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<40.027000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.662000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.027000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<40.027000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.757000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.122000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<38.122000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.122000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.757000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<38.122000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.027000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.757000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.757000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.662000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.662000,0.000000,1.186500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.662000,0.000000,1.186500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<34.312000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<31.772000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<29.232000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<26.692000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<24.152000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<21.612000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<19.072000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.852000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<39.392000,0.000000,1.821500>}
//PRG silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,11.096000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,9.826000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,9.826000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,9.826000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,9.191000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,9.191000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,9.191000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,9.826000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,9.826000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,9.191000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,8.556000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,9.191000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,8.556000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,7.286000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,7.286000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,7.286000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,6.651000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,6.651000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,6.651000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,7.286000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,7.286000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,7.286000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,8.556000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,8.556000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,8.556000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,9.191000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,8.556000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,14.271000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,13.636000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,14.271000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,13.636000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,12.366000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,12.366000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,12.366000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,11.731000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,11.731000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,11.731000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,12.366000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,12.366000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,12.366000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,13.636000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,13.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,13.636000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,14.271000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,13.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,11.096000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,11.731000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,11.731000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,11.731000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,11.096000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,11.096000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,9.826000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,11.096000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,11.096000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,18.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,17.446000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,17.446000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,17.446000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,16.811000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,16.811000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,16.811000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,17.446000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,17.446000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,16.811000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,16.176000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,16.811000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,16.176000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,14.906000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,14.906000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,14.906000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,14.271000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,14.271000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,14.271000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,14.906000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,14.906000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,14.906000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,16.176000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,16.176000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,16.176000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,16.811000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,16.176000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,19.351000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,19.351000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.410500,0.000000,19.351000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,18.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,19.351000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,19.351000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,19.351000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,18.716000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,18.716000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,17.446000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,18.716000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,18.716000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,6.651000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,6.651000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.410500,0.000000,6.651000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,7.921000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,10.461000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,13.001000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,15.541000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,18.081000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,18.796000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,18.796000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,18.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,17.526000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,17.526000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<39.395400,0.000000,18.161000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<41.122600,0.000000,18.161000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,16.002000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,14.732000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,14.732000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<39.395400,0.000000,15.367000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<41.122600,0.000000,15.367000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,13.208000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,11.938000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,11.938000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<39.395400,0.000000,12.573000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<41.122600,0.000000,12.573000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.253200,-1.536000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.830800,-1.536000,5.334000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.830800,-1.536000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.253200,-1.536000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.830800,-1.536000,6.604000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.830800,-1.536000,6.604000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<17.678400,-1.536000,5.969000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<19.405600,-1.536000,5.969000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.253200,-1.536000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.830800,-1.536000,8.509000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.830800,-1.536000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.253200,-1.536000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.830800,-1.536000,9.779000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.830800,-1.536000,9.779000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<17.678400,-1.536000,9.144000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<19.405600,-1.536000,9.144000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.205200,-1.536000,14.364000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.782800,-1.536000,14.364000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.782800,-1.536000,14.364000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.205200,-1.536000,15.634000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.782800,-1.536000,15.634000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.782800,-1.536000,15.634000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<17.630400,-1.536000,14.999000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<19.357600,-1.536000,14.999000>}
//RED silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,23.951000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,23.951000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,23.951000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,23.951000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,17.451000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.526000,0.000000,17.451000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,17.451000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,17.451000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,17.451000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,17.451000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,23.951000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.026000,0.000000,23.951000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,18.161000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.546000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,18.161000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,23.241000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.006000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,23.241000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,23.241000> }
//REG silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.632500,0.000000,20.775500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.182500,0.000000,21.325500>}
box{<0,0,-0.063500><0.777817,0.036000,0.063500> rotate<0,-44.997030,0> translate<9.632500,0.000000,20.775500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.182500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.182500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.182500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.182500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.582500,0.000000,20.925500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<11.182500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.582500,0.000000,20.925500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.982500,0.000000,21.325500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.582500,0.000000,20.925500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.982500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.982500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.982500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.982500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.382500,0.000000,20.925500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<12.982500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.382500,0.000000,20.925500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.782500,0.000000,21.325500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.382500,0.000000,20.925500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.782500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.782500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.782500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.782500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.182500,0.000000,20.925500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<14.782500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.182500,0.000000,20.925500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.582500,0.000000,21.325500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<15.182500,0.000000,20.925500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.582500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.582500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.582500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.582500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.982500,0.000000,20.925500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<16.582500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.982500,0.000000,20.925500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.382500,0.000000,21.325500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.982500,0.000000,20.925500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.382500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.382500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.382500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.382500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.932500,0.000000,20.775500>}
box{<0,0,-0.063500><0.777817,0.036000,0.063500> rotate<0,44.997030,0> translate<18.382500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.932500,0.000000,20.775500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.932500,0.000000,19.775500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.932500,0.000000,19.775500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.932500,0.000000,19.775500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.382500,0.000000,19.225500>}
box{<0,0,-0.063500><0.777817,0.036000,0.063500> rotate<0,-44.997030,0> translate<18.382500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.382500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.382500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.382500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.382500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.982500,0.000000,19.625500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<16.982500,0.000000,19.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.982500,0.000000,19.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.582500,0.000000,19.225500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.582500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.582500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.582500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.582500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.582500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.182500,0.000000,19.625500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<15.182500,0.000000,19.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.182500,0.000000,19.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.782500,0.000000,19.225500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.782500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.782500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.782500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.782500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.782500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.382500,0.000000,19.625500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<13.382500,0.000000,19.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.382500,0.000000,19.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.982500,0.000000,19.225500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.982500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.982500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.982500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.982500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.982500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.582500,0.000000,19.625500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<11.582500,0.000000,19.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.582500,0.000000,19.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.182500,0.000000,19.225500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.182500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.182500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.182500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.182500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.182500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.632500,0.000000,19.775500>}
box{<0,0,-0.063500><0.777817,0.036000,0.063500> rotate<0,44.997030,0> translate<9.632500,0.000000,19.775500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.632500,0.000000,19.775500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.632500,0.000000,20.775500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<9.632500,0.000000,20.775500> }
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<10.682500,0.000000,20.275500>}
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<12.482500,0.000000,20.275500>}
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<14.282500,0.000000,20.275500>}
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<16.082500,0.000000,20.275500>}
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<17.882500,0.000000,20.275500>}
//SOIC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.675000,0.000000,16.630000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.675000,0.000000,6.230000>}
box{<0,0,-0.076200><10.400000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.675000,0.000000,6.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.675000,0.000000,6.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.825000,0.000000,6.230000>}
box{<0,0,-0.076200><5.850000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.825000,0.000000,6.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.825000,0.000000,6.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.825000,0.000000,16.630000>}
box{<0,0,-0.076200><10.400000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.825000,0.000000,16.630000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.825000,0.000000,16.630000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.675000,0.000000,16.630000>}
box{<0,0,-0.076200><5.850000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.825000,0.000000,16.630000> }
difference{
cylinder{<29.800000,0,15.655000><29.800000,0.036000,15.655000>0.535800 translate<0,0.000000,0>}
cylinder{<29.800000,-0.1,15.655000><29.800000,0.135000,15.655000>0.383400 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,15.655000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,15.655000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,15.005000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,14.355000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,15.005000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,14.355000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,13.705000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,13.055000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,12.405000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,11.755000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,11.105000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,10.455000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,9.805000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,9.155000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,8.505000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,7.855000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,7.205000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,13.705000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,13.055000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,12.405000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,11.755000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,11.105000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,10.455000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,9.805000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,9.155000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,8.505000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,7.855000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,7.205000>}
//U$1 silk screen
//U$2 silk screen
//U$3 silk screen
//U$4 silk screen
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  CONTROL_REV6(-31.775500,0,-13.333250,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//REG	REG	1X05_2MM
//U$1		STAND-OFF
//U$2		STAND-OFF
//U$3		STAND-OFF
//U$4		STAND-OFF
