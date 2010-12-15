/*
 * File: globals.h
 * Author: George Hadley
 * Description: aliases used in the RGBSaber Firmware v2.0
 */

 //Global Variable Declarations:
 char red = 0x00;		//Red output level
 char green = 0x00; 		//Green output level
 char blue = 0x00;  		//Blue output level
 char redPrev = 0x00;  		//Previous red output level
 char greenPrev = 0x00; 	//Previous green output level
 char bluePrev = 0x00;		//Previous blue output level
 char redPwm = 0x00; 		//Red PWM Accumulator
 char greenPwm = 0x00; 		//Green PWM Accumulator
 char bluePwm = 0x00;  		//Blue PWM Accumulator
 char msecCnt = 0x00;		//Milisecond counter
 char secCnt = 0x00;		//Second counter
 char minCnt = 0x00;		//Minute counter
 char flashCnt = 0x00;          //Flash counter (counts interrupts)

 char editable;        //Color editable flag
 char redFlag;         //Indicates red is selected
 char greenFlag;       //Indicates green is selected
 char blueFlag;        //Indicates blue is selected
 char colorPb;         //Indicates color pb is pressed
 char colorPbPrev;     //Used for color pb debouncing
 char editPb;          //Indicates edit pb is selected
 char editPbPrev;      //Used for edit pb debouncing

 char flash;
 char inactive;
 char oneSec;
 /*
 //Color-related flags
 extern volatile unsigned char color;
 extern volatile struct {
    unsigned editable:1;        //Color editable flag
    unsigned redFlag:1;         //Indicates red is selected
    unsigned greenFlag:1;       //Indicates green is selected
    unsigned blueFlag:1;        //Indicates blue is selected
    unsigned colorPb:1;         //Indicates color pb is pressed
    unsigned colorPbPrev:1;     //Used for color pb debouncing
    unsigned editPb:1;          //Indicates edit pb is selected
    unsigned editPbPrev:1;      //Used for edit pb debouncing
} colorbits;

 //System status flags
 extern volatile unsigned char status0;
 extern volatile struct {
    unsigned flash:1;           //Indicates indicator flash
    unsigned inactive:1;        //Indicates no activity
    unsigned oneSec:1;          //Indicates 1 second has passed
    unsigned :5;
 } status0bits;
 */