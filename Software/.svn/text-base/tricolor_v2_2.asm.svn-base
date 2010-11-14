;*********************************************************************************************
; File: main.asm
; Description: main assembly file for tricolor lightsaber LED code
; Programmer: George Hadley
; Program History:
;	   Date			Ver					Description
;   10/20/2008 		0.0		Initial program created
;	10/23/2008		0.0		I/O,RTI,ADC initializations developed, button debouncing code created
;							resolved #define error, toggle_color subroutine developed
;	10/25/2008		0.0		Button Toggle code debugged, read_color_port and is_editable routines
;							developed
;	10/26/2008		1.0		is_editable code completed, wrote and debugged pwm output code, removed
;							is_editable from code (for now)
;	11/06/2008		1.0		Worked on tricolor_v1 debug process
;	12/14/2008		1.1		Developed 2-button editability feature
;	12/16/2008		1.2		LED Flash Indicator feature added to indicate color is editable
;	02/19/2009		1.3		Firmware updated to work with common cathode luxeon led
;	03/05/2009		2.0		Began work on lightsaber EEPROM memory access routines
;	03/06/09		2.0		EEPROM Memory access code completed, began work on saber timeout code
;	03/08/09		2.0		tricolor_v2 code completed (not debugged)
;	03/12/09		2.0		configuration bits incorporated into code
;	06/02/09		2.1		Software power_on/power_off code created, editpb button debouncing
;							error corrected
;	12/19/09		2.1		Code revisions incorporated for product sale at The Custom Saber Shop
;							(switched to one button configuration)
;	2/05/10			2.2		Indicator brightness corrected in code
;
; Notes:
;   1) color: A status register containing status flags for color control
;	   Bit	Abbrev. 		Name						Description	Bit Values
;	    0	 editable	Editable Flag			Indicates if currently selected color is editable by color adjuster			 (1:editable, 0:uneditable)
;	    1	 red_flag	Red Color Select		Indicates if red is currently selected 						 	 (1:selected, 0:unselected)
;	    2    green_flag	Green Color Select		Indicates if green is currently selected 						 (1:selected, 0:unselected)
;	    3	 blue_flag	Blue Color Select		Indicates if blue is currently selected 						 (1:selected, 0:unselected)
;	    4	 colorpb	Color Pushbutton Flag		Indicates if the color pushbutton flag is pressed 					 (1:was pressed, 0:was not pressed)
;	    5	 prevpb0	Previous Pushbutton Flag 0	Saves previous state of color select pushbutton (used to debounce color select button)   (1:was pressed, 0:was not pressed)
;	    6	 editpb		Color editable pushbutton	Indicates if edit pushbutton is pressed							 (1:was pressed, 0:was not pressed)
;	    7	 prevpb1	Previous Pushbutton Flag 1	Saves previous state of edit pushbutton	(used for button debouncing)			 (1:was pressed, 0:was not pressed)
;	2) status0: Status register containing other status flags
;	   Bit	Abbrev.			Name				Description						Bit Values
;	    0	pwron		Power status bit	Indicates "on/off" state of system				    (1: on, 0: off)
;	    1	flash		Initiate flash bit	Indicates whether to flash indicator or	not			    (1:flash indicator, 0:don't flash)
;	    2	inactive	Lightsaber inactivity	Indicates if no activity has occurred since previous start loop	    (1:inactive, 0:active)
;	    3	onesec		1-second flag		Indicates 1 second has passed					    (1:second passed, 0:second not passed)
;	
;	3) Program I/O pins:
;	   Pin	      Abbrev			Name				Description
;     	  02(AN0)  color_adjust		Color Adjuster Pin		Color adjuster slider pin
;	  13(RC2)  color_select		Color Selector Pin		Color selecter pushbutton pin
;	  14(RC3)  edit_select		Edit Selector Pin		Color edit select pushbutton
;	  21(RB0)  blue_pwm		Blue PWM Output Pin		PWM output for Blue LEDs
;	  22(RB1)  green_pwm		Green PWM Output Pin		PWM output for Green LEDs
;	  23(RB2)  red_pwm		Red PWM Output Pin		PWM output for Red LEDs
;	  24(RB3)  blue_indicate	Blue LED indicator		Output for blue led status indicator
;	  25(RB4)  green_indicate	Green LED indicator		Output for green led status indicator
;	  26(RB5)  red_indicate		Red LED indicator		Output for red led status indicator
;
;	4) Interrupt Rate: 8.192ms
;
;	5) If there exists a chance that pins have "funky" voltages (diodes, transistors w/o resistors, etc), use latch pins instead of port pins
;
; To-Do List:
;   1) Add auto shutdown feature after certain period of inactivity has passed
;   2) Write up code to save final state of blade before power off and re-enable upon power-up
;*********************************************************************************************
	#include<p18f2221.inc>
	list p = p18f2221, r = dec
	;set configuration bits
	config wdt=off,lvp=off,osc=intio2,bor=off,cp0=off,cp1=off,cpb=off,cpd=off,wrt0=off,wrt1=off,wrtd=off
	cblock 0	  ;Variable initializations
	    color	  ;color status register (see note 1 in header)
	    status0	  ;general status register 0 (see note 2 in header)
	    msec_cnt	  ;milisecond count register (counts interrupts)
	    sec_cnt	  ;second count register (counts interrupts)
	    min_cnt	  ;minute count register (counts interrupts)
	    flashcnt	  ;flash count register (counts interrupts)
	    red_level1	  ;stores previous red color level
	    green_level1  ;stores previous green color level
	    blue_level1	  ;stores previous blue color level
	    red_level0	  ;stores current color level of red leds
	    green_level0  ;stores current color level of green leds
	    blue_level0	  ;stores current color level of blue leds
	    red_pwm_acc   ;red pwm accumulator register
	    green_pwm_acc ;green pwm accumulator register
	    blue_pwm_acc  ;blue pwm accumulator register
	endc
	;color bit definitions
	#define	editable   color,0
	#define	red_flag   color,1
	#define	green_flag color,2
	#define	blue_flag  color,3
	#define	colorpb    color,4
	#define	prevpb0    color,5
	#define	editpb	   color,6
	#define	prevpb1	   color,7

	;status0 bit definitions
	#define pwron	 status0,0
	#define flash 	 status0,1
	#define inactive status0,2
	#define onesec 	 status0,3

    ;I/O pin definitions
	#define color_adjust porta,0
	#define	blue_pwm latb,0
	#define	green_pwm latb,1
	#define red_pwm latb,2
	#define blue_indicate latb,3
	#define green_indicate latb,4
	#define red_indicate latb,5
	#define color_select portc,2
	#define edit_select portc,3

	;Program constants
	;Memory storage locations for red/green/blue pwm values
	#define	red_loc 0x00
	#define green_loc 0x01
	#define	blue_loc 0x02
	;Timing Constants
	#define halfsec d'60'
	#define second d'122'
	#define	minute d'60'
	#define	expire 1
	;Other Definitions
	#define flashval 0x20			;Flash count value
	#define shift_tmr 0x3C	;60 interrupt wait delay before entering color select mode

	org 0
	movlw 	b'01111000'	;Initialize 8MHz internal clock
	movwf 	OSCCON			
	bra 	initialize	;skip ahead to start of code (leave space for interrupt code)

	org	08h		;starting point for interrupt code
tmr0_overflow	;Timer0 overflow interrupt service routine
	bcf		INTCON,TMR0IF	;clear tmr0 overflow interrupt flag (prepare for next interrupt)
	btfsc 	color_select	;Clear colorpb, prevpb if button is not currently pressed
	bra 	no_colorpb
	dcfsnz	msec_cnt
	bra		power
	btfss 	prevpb0	
	bra 	set_colorpb
	bcf 	colorpb
	bsf 	prevpb0
	bra 	tmr0_return
set_colorpb
	bsf 	colorpb
	bsf		prevpb0
	bra 	tmr0_return
no_colorpb
	movlw	halfsec
	movwf	msec_cnt
	bcf 	colorpb
	bcf		prevpb0
	bra		tmr0_return
;check_flash
;	btfsc 	editable
;	goto 	check_time
;	decf 	flashcnt
;	bnz		check_time
;	movlw 	flashval
;	movwf 	flashcnt
;	bsf 	flash
;	bra		tmr0_return
power
	btg		pwron		;Toggle power on/off bit
	movlw	halfsec		;Reload msec counter for another round
	movwf	msec_cnt
tmr0_return
	;Code to limit intensity of rgb indicator led in software
	btfsc	red_flag
	btg		red_indicate
	btfsc	green_flag
	btg		green_indicate
	btfsc	blue_flag
	btg		blue_indicate
	retfie 	fast

initialize
  ;I/O Port initializations
	bsf	trisc,2		;initialize portc,2 and portc,3 to be used as inputs
	bsf	trisc,3
	movlw 	b'00011000'	;Turn on red indicator, blade initially off
	movwf 	latb
	clrf	trisb		;portb to be used as outputs
	setf 	trisa		;use porta as inputs
  ;Interrupt initializations (TMR0 Overflow Interrupt)
	movlw 	b'11010101'	;activate timer0 in 8-bit mode, prescale by 64
	movwf 	T0CON			
	bsf	INTCON,TMR0IE	;enable timer0 interrupts
	bsf 	INTCON,GIE		;enable global interrupts
  ;ADC Initializations
	bsf 	ADCON0,ADON
	movlw 	0x0E
	movwf 	ADCON1
  ;User Variable Initializations
    movlw 	0x03
	movwf 	color
	clrf	status0
	movlw 	flashval
	movwf 	flashcnt
	movlw	halfsec		;60 interrupts ~= .5 seconds
	movwf	msec_cnt
	movlw	minute		;60 seconds = 1 minute
	movwf	sec_cnt
	movlw	expire		;set timeout to occur at 4 minutes
	movwf	min_cnt

	clrf 	red_level1
	clrf 	green_level1
	clrf 	blue_level1
	clrf 	red_level0
	clrf 	green_level0
	clrf 	blue_level0
	clrf 	red_pwm_acc
	clrf 	green_pwm_acc
	clrf 	blue_pwm_acc

start0		;Main Program Loop
	btfss	pwron
	call	power_down
	btfsc 	colorpb			;Toggle color if color select has been pressed
	call 	toggle_color
	call 	read_color_port	;Initiate AD conversion on color adjustor for currently selected color
;	btfss 	editpb
	bra	start1
;	btg	editable
	bcf	editpb
start1
;	btfsc 	editable
	call 	shift_color		;Update selected color if color is editable
;	btfsc	editable
	call	indicate_color	;Indicate 
	btfsc 	flash
	call 	flash_indicate	;Flash color indicator if flash bit is enabled
	call 	output_pwm		;Output blade PWM color
	bra	start0	

;************************************************************************************************
; Subroutine: power_down
; Description: deactivates led lights and ADC to save power, reactivate system on button press
;************************************************************************************************
power_down
;	bcf	editable			;Prevent any accidental last minute changes
	movff	red_level0, red_level1		;Save state of red color
	movff	green_level0, green_level1	;Save state of green color
	movff	blue_level0, blue_level1	;Save state of blue color
	movlw	0x00
	movwf	red_level0			;Shut off red led
	movwf	green_level0			;Shut off green led
	movwf	blue_level0			;Shut off blue led
	call	output_pwm
	bsf	red_indicate			;Shut off red indicator light
	bsf	green_indicate			;Shut off green indicator light
	bsf	blue_indicate			;Shut off blue indicator light
	bcf	ADCON0,ADON			;Deactivate the ADC
power_wait_loop
	btfsc	pwron		;Check to see if color selector was pressed
	bra	power_up
	bra	power_wait_loop
power_up
	movff	red_level1, red_level0		;Reactivate red led
	movff	green_level1, green_level0	;Reactivate green led
	movff	blue_level1, blue_level0	;Reactivate blue led
	call	output_pwm
	call	indicate_color			;Reactivate correct color
	bsf	ADCON0,ADON			;Re-engage ADC
	return	

;************************************************************************************************
; Subroutine: indicate_color
; Description: If color is editable, lights up appropriate color indicator (used to prevent output glitch)
;************************************************************************************************
indicate_color
	btfsc	red_flag
	bcf	red_indicate
	btfsc	green_flag
	bcf	green_indicate
	btfsc	blue_flag
	bcf	blue_indicate
	return

;************************************************************************************************
; Subroutine: toggle_color
; Description: looks at the current color state and goes to the next color state (sets flags and
;	indicator LED accordingly) (Red -> Green -> Blue -> Lock) (if lock is reached, color select goes
;	back to red)
;************************************************************************************************
toggle_color
	btfsc 	red_flag
	bra 	select_green
	btfsc 	green_flag
	bra 	select_blue
	btfsc 	blue_flag
	bra 	select_lock
	bra 	select_red
end_toggle
;	call	reset_counter
	bcf 	colorpb
	return

select_red
	bsf 	red_flag
	bcf	red_indicate
	bra 	end_toggle
select_green
	bcf 	red_flag
	bsf	green_flag
	bsf 	red_indicate
	bcf 	green_indicate
	bra 	end_toggle
select_blue
	bcf 	green_flag
	bsf 	blue_flag
	bsf	green_indicate
	bcf	blue_indicate
	bra 	end_toggle
select_lock
	bcf 	blue_flag
	bsf 	blue_indicate
	bra 	end_toggle
	
;*******************************************************************************************
; Subroutine: read_color_port
; Description: Initiates A/D conversions on the currently selected color port
;*******************************************************************************************
read_color_port
	bsf	ADCON0,GO_DONE		;Initiate A/D Conversion on color_adjust pin
ADC_wait_loop
	btfsc 	ADCON0,GO_DONE	;Wait until A/D Conversion finishes
	bra	ADC_wait_loop
ADC_store
	btfsc 	red_flag
	bra 	store_red
	btfsc 	green_flag
	bra 	store_green
	btfsc 	blue_flag
	bra 	store_blue
ADC_return	
	return

store_red	
	movff 	ADRESH,red_level1
	bra 	ADC_return
store_green
	movff 	ADRESH,green_level1
	bra 	ADC_return
store_blue
	movff 	ADRESH,blue_level1
	bra 	ADC_return

;***********************************************************************************************
; Subroutine: shift_color
; Description: If color is editable, shifts color to level0 variable to be output via PWM
;***********************************************************************************************
shift_color
	btfsc	red_flag
	movff	red_level1,red_level0
	btfsc	green_flag
	movff	green_level1,green_level0
	btfsc	blue_flag
	movff	blue_level1,blue_level0
shift_return
	return

;***********************************************************************************************
; Subroutine: flash_indicate
; Description: Flash LED Indicator if selected color is editable
;***********************************************************************************************
flash_indicate
	bcf	flash
	movlw	flashval
	movwf	flashcnt
	btfsc	red_flag
	btg	red_indicate
	btfsc	green_flag
	btg	green_indicate
	btfsc	blue_flag
	btg	blue_indicate
	return

;***********************************************************************************************
; Subroutine: output_pwm
; Description: Software pwm routine for tricolor lightsaber
;***********************************************************************************************
output_pwm
	movf 	red_level0,w
	addwf 	red_pwm_acc,f
	bc 	output_red
	bcf 	red_pwm				;ERROR: shuts off red_indicator as well as red_pwm
test_green
	movf 	green_level0,w
	addwf 	green_pwm_acc,f
	bc 	output_green
	bcf	green_pwm
test_blue
	movf 	blue_level0,w
	addwf 	blue_pwm_acc,f
	bc 	output_blue
	bcf 	blue_pwm
output_return
	return

output_red
	bsf 	red_pwm
	bra 	test_green
output_green
	bsf 	green_pwm
	bra 	test_blue
output_blue
	bsf 	blue_pwm
	bra 	output_return

	end 
