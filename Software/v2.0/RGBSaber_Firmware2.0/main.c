/*
 * File:   main.c
 * Author: George Hadley
 * Description: main file for RGBSaber firmware v2
 * Created on December 9, 2010, 6:36 PM
 */

#include <p18f2221.h>
#include "aliases.h"
#include "constants.h"
#include "globals.h"
//Global Function Declarations
void T0Interrupt();     //Timer0 interrupt service routine
void Initialize18f2221();      //Microcontroller device initializations
void ToggleColor();     //Used to adjust color state
void ReadColorPort();   //Initiates A/D conversions on active color port
void SoftwarePwm();     //Run Software PWM on color ports

void main(void) {
    Initialize18f2221();
    while(1) {

    }
    return;
}

/*
 * Function: T0Interrupt()
 * Description: Timer0 Overflow Interrupt
 * Notes:
 * Version: 0.0
 * Last Modified: 12-15-2010
 */
void T0Interrupt() {
    return;
}

/*
 * Function: Initialize18f2221()
 * Description: Performs device initializations for the PIC18F2221
 * Notes:
 * Version: 0.0
 * Last Modified: 12-15-2010
 */
void Initialize18f2221() {
    //IO port initializations
    //Initialize portc,2 (color select) and portc,3 (edit select) to inputs
    regColorSelect = 0;
    regEditSelect = 0;
    LATB = 0x18;    //(0001 1000) Turn on red indicator, blade initially off
    TRISB = 0x00;   //(0000 0000) Set portb to be used as outputs
    TRISA = 0xFF;   //(1111 1111) Set porta to be used as inputs

    //ADC Initializations
    ADCON0bits.ADON = 1;    //Activate A/D Converter
    ADCON1 = 0x0E;          //(0000 1110) Configure AN0 as analog input

    //User Variable Initializations
    flashCnt = FLASHVAL;
    msecCnt = SECOND;
    secCnt = MINUTE;
    minCnt = EXPIRE;

    //Interrupt initializations (TMR0 Overflow Interrupt)
    T0CON = 0xC5;   //(1101 0101) Activate timer0 in 8-bit mode, prescale by 64
    INTCONbits.TMR0IE = 1;   //Enable Timer0 Interrupts
    INTCONbits.GIE = 1;      //Enable Global Interrupts

    return;
}

/*
 * Function: ToggleColor()
 * Description: Adjusts the active color flag and indicator in event of
 *      color selector being pushed
 * Notes:
 *   1) Color Indicator LED is, at time of this design, common anode. Therefore,
 *      a given color indicator is turned on by setting it to 0 and turned off
 *      by setting to 1
 * Version: 0.0
 * Last Modified: 12-15-2010
 */
void ToggleColor() {
    if(redFlag) {
        //Activate green flag (green is now active color)
        redFlag = 0;
        greenFlag = 1;
        //Deactivate red indicator, activate green indicator
        regRedIndicate = 1;
        regGreenIndicate = 0;
    } else if(greenFlag) {
        //Activate blue flag (blue is now active color)
        greenFlag = 0;
        blueFlag = 1;
        //Deactivate green indicator, activate blue indicator
        regGreenIndicate = 1;
        regBlueIndicate = 0;
    } else if(blueFlag) {
        //Deactivate all flags (color lock state)
        blueFlag = 0;
        //Deactivate blue indicator (color lock state)
        regBlueIndicate = 1;
    } else {
        //Activate red flag (red is now active color)
        redFlag = 1;
        //Activate red indicator
        regRedIndicate = 0;
    }
    //colorPb was pressed, thus deactivate flag till next press
    colorPb = 0;
    return;
}

/*
 * Function: ReadColorPort()
 * Description: Initiates A/D Conversions on the active color port
 * Notes:
 * Version: 0.0
 * Last Modified: 12-15-2010
 */
void ReadColorPort() {
    ADCON0bits.GO = 1;  //Initiate A/D Conversion on Color Adjuster
    while(ADCON0bits.GO_NOT_DONE) { //Wait for AD conversion to finish
    }
    if(redFlag) {           //If red active, move AD result to previous red
        redPrev = ADRESH;
    } else if(greenFlag) {  //If green active, move AD result to previous green
        greenPrev = ADRESH;
    } else if(blueFlag) {   //If blue active, move AD result to previous blue
        bluePrev = ADRESH;
    }
    return;
}

/*
 * Function: SoftwarePWM()
 * Description: Performs software PWM on all color ports
 * Notes:
 *   1) The Software PWM algorithm is derived from chapter 21
 *      ("Fun with Trains") of the Basic Stamp App Note found here:
 *      http://www.parallax.com/dl/appnt/stamps/bs1appnotes.pdf
 *   2) regRedPwm, regGreenPwm, and regBluePwm interface to bases of
 *      power transistors, thus setting them to 1 activates the color and
 *      setting them to 0 deactivates the color
 * Version: 0.0
 * Last Modified: 12-15-2010
 */
void SoftwarePwm() {
    redPwm = redPwm + red;
    regRedPwm = STATUSbits.C?1:0;   //If carry bit is set, activate red luxeon
    greenPwm = greenPwm + green;
    regGreenPwm = STATUSbits.C?1:0; //If carry bit is set, activate green luxeon
    bluePwm = bluePwm + blue;
    regBluePwm = STATUSbits.C?1:0;  //If carry bit is set, activate blue luxeon
    return;
}

