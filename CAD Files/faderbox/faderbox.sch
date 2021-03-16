EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L teensy:Teensy-LC U1
U 1 1 601ED08E
P 4700 2900
F 0 "U1" H 4725 4137 60  0000 C CNN
F 1 "Teensy-LC" H 4725 4031 60  0000 C CNN
F 2 "teensy:Teensy_LC-reduced" H 4700 2350 60  0001 C CNN
F 3 "" H 4700 2350 60  0000 C CNN
	1    4700 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 601EE4FD
P 7750 3250
F 0 "J2" H 7668 2725 50  0000 C CNN
F 1 "exp" H 7668 2816 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 7750 3250 50  0001 C CNN
F 3 "~" H 7750 3250 50  0001 C CNN
	1    7750 3250
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 601EF9E5
P 3000 1950
F 0 "J1" H 2918 2167 50  0000 C CNN
F 1 "GND to Faders" H 2918 2076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3000 1950 50  0001 C CNN
F 3 "~" H 3000 1950 50  0001 C CNN
	1    3000 1950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5900 3450 6200 3450
Wire Wire Line
	6200 2750 5900 2750
$Comp
L Device:R R2
U 1 1 601F52F3
P 6450 2900
F 0 "R2" H 6520 2946 50  0000 L CNN
F 1 "1M" H 6520 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6380 2900 50  0001 C CNN
F 3 "~" H 6450 2900 50  0001 C CNN
	1    6450 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3350 6450 3350
Wire Wire Line
	6450 3350 6450 3050
Wire Wire Line
	6450 2750 6200 2750
Connection ~ 6200 2750
$Comp
L Device:R R3
U 1 1 601F61D8
P 6700 2900
F 0 "R3" H 6770 2946 50  0000 L CNN
F 1 "1M" H 6770 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6630 2900 50  0001 C CNN
F 3 "~" H 6700 2900 50  0001 C CNN
	1    6700 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3250 6700 3250
Wire Wire Line
	6700 3250 6700 3050
Wire Wire Line
	6700 2750 6450 2750
Connection ~ 6450 2750
$Comp
L Device:R R4
U 1 1 601F696D
P 6950 2900
F 0 "R4" H 7020 2946 50  0000 L CNN
F 1 "1M" H 7020 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 2900 50  0001 C CNN
F 3 "~" H 6950 2900 50  0001 C CNN
	1    6950 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3150 6950 3150
Wire Wire Line
	6950 3150 6950 3050
Wire Wire Line
	6950 2750 6700 2750
Connection ~ 6700 2750
Wire Wire Line
	6200 3450 7550 3450
Connection ~ 6200 3450
Wire Wire Line
	7550 3350 6450 3350
Connection ~ 6450 3350
Wire Wire Line
	7550 3250 6700 3250
Connection ~ 6700 3250
Wire Wire Line
	6950 3150 7550 3150
Connection ~ 6950 3150
Wire Wire Line
	6950 2750 7250 2750
Wire Wire Line
	7250 2750 7250 3050
Wire Wire Line
	7250 3050 7550 3050
Connection ~ 6950 2750
Wire Wire Line
	5900 2850 7400 2850
Wire Wire Line
	7400 2850 7400 2950
Wire Wire Line
	7400 2950 7550 2950
Wire Wire Line
	3200 1950 3350 1950
Wire Wire Line
	3550 3550 3350 3550
Wire Wire Line
	3350 3550 3350 1950
Connection ~ 3350 1950
Wire Wire Line
	3350 1950 3550 1950
Wire Wire Line
	6200 2750 6200 1550
Wire Wire Line
	6200 1550 3350 1550
Wire Wire Line
	3350 1550 3350 1950
Wire Wire Line
	6200 3450 6200 3050
$Comp
L Device:R R1
U 1 1 601EFDDF
P 6200 2900
F 0 "R1" H 6270 2946 50  0000 L CNN
F 1 "1M" H 6270 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6130 2900 50  0001 C CNN
F 3 "~" H 6200 2900 50  0001 C CNN
	1    6200 2900
	1    0    0    -1  
$EndComp
$Comp
L Imports:RSA0N11S9A0K VR1
U 1 1 6021A77E
P 6300 4000
F 0 "VR1" V 6704 4128 50  0000 L CNN
F 1 "10k" V 6795 4128 50  0000 L CNN
F 2 "Imports:RSA0N11S9A0K" H 7050 4100 50  0001 L CNN
F 3 "" H 7050 4000 50  0001 L CNN
F 4 "Alps Electric 1 Gang Slide Metal Potentiometer, +/-20%, 0.5W, Logarithmic RSA0N11S9A0K" H 7050 3900 50  0001 L CNN "Description"
F 5 "16.2" H 7050 3800 50  0001 L CNN "Height"
F 6 "688-RSA0N11S9A0K" H 7050 3700 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/ALPS/RSA0N11S9A0K?qs=YMSFtX0bdJDUs6cStIZ0Kg%3D%3D" H 7050 3600 50  0001 L CNN "Mouser Price/Stock"
F 8 "ALPS" H 7050 3500 50  0001 L CNN "Manufacturer_Name"
F 9 "RSA0N11S9A0K" H 7050 3400 50  0001 L CNN "Manufacturer_Part_Number"
	1    6300 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3850 6200 3850
Wire Wire Line
	6200 3850 6200 4000
$Comp
L Imports:RSA0N11S9A0K VR2
U 1 1 602218B6
P 6900 4000
F 0 "VR2" V 7304 4128 50  0000 L CNN
F 1 "10k" V 7395 4128 50  0000 L CNN
F 2 "Imports:RSA0N11S9A0K" H 7650 4100 50  0001 L CNN
F 3 "" H 7650 4000 50  0001 L CNN
F 4 "Alps Electric 1 Gang Slide Metal Potentiometer, +/-20%, 0.5W, Logarithmic RSA0N11S9A0K" H 7650 3900 50  0001 L CNN "Description"
F 5 "16.2" H 7650 3800 50  0001 L CNN "Height"
F 6 "688-RSA0N11S9A0K" H 7650 3700 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/ALPS/RSA0N11S9A0K?qs=YMSFtX0bdJDUs6cStIZ0Kg%3D%3D" H 7650 3600 50  0001 L CNN "Mouser Price/Stock"
F 8 "ALPS" H 7650 3500 50  0001 L CNN "Manufacturer_Name"
F 9 "RSA0N11S9A0K" H 7650 3400 50  0001 L CNN "Manufacturer_Part_Number"
	1    6900 4000
	0    1    1    0   
$EndComp
$Comp
L Imports:RSA0N11S9A0K VR3
U 1 1 60222FF8
P 7500 4000
F 0 "VR3" V 7904 4128 50  0000 L CNN
F 1 "10k" V 7995 4128 50  0000 L CNN
F 2 "Imports:RSA0N11S9A0K" H 8250 4100 50  0001 L CNN
F 3 "" H 8250 4000 50  0001 L CNN
F 4 "Alps Electric 1 Gang Slide Metal Potentiometer, +/-20%, 0.5W, Logarithmic RSA0N11S9A0K" H 8250 3900 50  0001 L CNN "Description"
F 5 "16.2" H 8250 3800 50  0001 L CNN "Height"
F 6 "688-RSA0N11S9A0K" H 8250 3700 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/ALPS/RSA0N11S9A0K?qs=YMSFtX0bdJDUs6cStIZ0Kg%3D%3D" H 8250 3600 50  0001 L CNN "Mouser Price/Stock"
F 8 "ALPS" H 8250 3500 50  0001 L CNN "Manufacturer_Name"
F 9 "RSA0N11S9A0K" H 8250 3400 50  0001 L CNN "Manufacturer_Part_Number"
	1    7500 4000
	0    1    1    0   
$EndComp
$Comp
L Imports:RSA0N11S9A0K VR4
U 1 1 60224513
P 8100 4000
F 0 "VR4" V 8504 4128 50  0000 L CNN
F 1 "10k" V 8595 4128 50  0000 L CNN
F 2 "Imports:RSA0N11S9A0K" H 8850 4100 50  0001 L CNN
F 3 "" H 8850 4000 50  0001 L CNN
F 4 "Alps Electric 1 Gang Slide Metal Potentiometer, +/-20%, 0.5W, Logarithmic RSA0N11S9A0K" H 8850 3900 50  0001 L CNN "Description"
F 5 "16.2" H 8850 3800 50  0001 L CNN "Height"
F 6 "688-RSA0N11S9A0K" H 8850 3700 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/ALPS/RSA0N11S9A0K?qs=YMSFtX0bdJDUs6cStIZ0Kg%3D%3D" H 8850 3600 50  0001 L CNN "Mouser Price/Stock"
F 8 "ALPS" H 8850 3500 50  0001 L CNN "Manufacturer_Name"
F 9 "RSA0N11S9A0K" H 8850 3400 50  0001 L CNN "Manufacturer_Part_Number"
	1    8100 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3750 6800 3750
Wire Wire Line
	6800 3750 6800 4000
Wire Wire Line
	5900 3650 7400 3650
Wire Wire Line
	7400 3650 7400 4000
Wire Wire Line
	5900 3550 8000 3550
Wire Wire Line
	8000 3550 8000 4000
Wire Wire Line
	6300 4000 6300 3850
Wire Wire Line
	6300 3850 6900 3850
Wire Wire Line
	6900 3850 6900 4000
Wire Wire Line
	6900 3850 7500 3850
Wire Wire Line
	7500 3850 7500 4000
Connection ~ 6900 3850
Wire Wire Line
	7500 3850 8100 3850
Wire Wire Line
	8100 3850 8100 4000
Connection ~ 7500 3850
Wire Wire Line
	6100 4000 6100 3950
Wire Wire Line
	6100 3950 6700 3950
Wire Wire Line
	6700 3950 6700 4000
Wire Wire Line
	6700 3950 7300 3950
Wire Wire Line
	7300 3950 7300 4000
Connection ~ 6700 3950
Wire Wire Line
	7300 3950 7900 3950
Wire Wire Line
	7900 3950 7900 4000
Connection ~ 7300 3950
Wire Wire Line
	8100 4900 8000 4900
Wire Wire Line
	7500 4900 8000 4900
Connection ~ 8000 4900
Wire Wire Line
	7500 4900 7400 4900
Connection ~ 7500 4900
Wire Wire Line
	7400 4900 6900 4900
Connection ~ 7400 4900
Wire Wire Line
	6300 4900 6800 4900
Connection ~ 6800 4900
Wire Wire Line
	6800 4900 6900 4900
Connection ~ 6900 4900
Wire Wire Line
	6300 4900 6200 4900
Connection ~ 6300 4900
Wire Wire Line
	6200 4900 5950 4900
Wire Wire Line
	5950 4900 5950 3950
Wire Wire Line
	5950 3950 6100 3950
Connection ~ 6200 4900
Connection ~ 6100 3950
Wire Wire Line
	8100 3850 8100 2850
Wire Wire Line
	8100 2850 7400 2850
Connection ~ 8100 3850
Connection ~ 7400 2850
$Comp
L power:GND #PWR0101
U 1 1 6024579B
P 3350 3650
F 0 "#PWR0101" H 3350 3400 50  0001 C CNN
F 1 "GND" H 3355 3477 50  0000 C CNN
F 2 "" H 3350 3650 50  0001 C CNN
F 3 "" H 3350 3650 50  0001 C CNN
	1    3350 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3650 3350 3550
Connection ~ 3350 3550
Wire Wire Line
	8100 4900 8300 4900
Wire Wire Line
	8300 4900 8300 2750
Wire Wire Line
	8300 2750 7250 2750
Connection ~ 8100 4900
Connection ~ 7250 2750
$EndSCHEMATC
