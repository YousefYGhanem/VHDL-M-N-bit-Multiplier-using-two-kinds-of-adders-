-------------------------------------------------------
-- Gates Library   
-------------------------------------------------------


-- NOT INVERTER GATE:  
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;		  

ENTITY NOTGATE IS
	PORT(x : IN STD_LOGIC;
		 y : OUT STD_LOGIC);
END ENTITY NOTGATE;

ARCHITECTURE not_arc OF NOTGATE IS
BEGIN
	y <= NOT x AFTER 4 NS;
END ARCHITECTURE not_arc;	 
----------------------------------------


--2 inputs AND Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;   

ENTITY ANDGATE2 IS
	PORT(x, y : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ANDGATE2;	  

ARCHITECTURE and_arc2 OF ANDGATE2 IS
BEGIN
	z <= x AND y AFTER 9 NS;
END ARCHITECTURE and_arc2;	 
----------------------------------------


-- 2 inputs OR Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ORGATE2 IS
	PORT(x, y : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ORGATE2;

ARCHITECTURE or_arc2 OF ORGATE2 IS
BEGIN
	z <= x OR y AFTER 9 NS;
END ARCHITECTURE or_arc2;
----------------------------------------


-- 2 inputs NAND GATE:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NANDGATE2 IS
	PORT(x, y : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY NANDGATE2; 

ARCHITECTURE nand_arc OF NANDGATE2 IS
BEGIN
	z <= x NAND y AFTER 6 NS;
END ARCHITECTURE nand_arc;	  	
----------------------------------------


-- 2 inputs NOR GATE:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NORGATE2 IS
	PORT(x, y : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY NORGATE2;	 

ARCHITECTURE nor_arc OF NORGATE2 IS
BEGIN
	z <= x NOR y AFTER 6 NS;
END ARCHITECTURE nor_arc; 		   
----------------------------------------


-- 2 inputs XOR GATE:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;  

ENTITY XORGATE2 IS
	PORT(x, y : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY XORGATE2;

ARCHITECTURE xor_arc2 OF XORGATE2 IS
BEGIN
	z <= x XOR y AFTER 12 NS;
END ARCHITECTURE xor_arc2;		 
----------------------------------------


-- 2 inputs XNOR GATE:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;  

ENTITY XNORGATE2 IS
	PORT(x, y : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY XNORGATE2;

ARCHITECTURE xnor_arc OF XNORGATE2 IS
BEGIN
	z <= x XNOR y AFTER 12 NS;
END ARCHITECTURE xnor_arc;		 
----------------------------------------


 --3 inputs AND Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;   

ENTITY ANDGATE3 IS
	PORT(x, y, q : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ANDGATE3;	  

ARCHITECTURE and_arc3 OF ANDGATE3 IS
BEGIN
	z <= ((x AND y) AND q) AFTER 9 NS;
END ARCHITECTURE and_arc3; 			
----------------------------------------


--4 inputs AND Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;   

ENTITY ANDGATE4 IS
	PORT(x, y, q, w : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ANDGATE4;	  

ARCHITECTURE and_arc4 OF ANDGATE4 IS
BEGIN
	z <= (((x AND y) AND q) AND w) AFTER 9 NS;
END ARCHITECTURE and_arc4; 	   
----------------------------------------


--5 inputs AND Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;   

ENTITY ANDGATE5 IS
	PORT(x, y, q, w, e : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ANDGATE5;	  

ARCHITECTURE and_arc5 OF ANDGATE5 IS
BEGIN
	z <= ((((x AND y) AND q) AND w) AND e) AFTER 9 NS;
END ARCHITECTURE and_arc5;	  		 
----------------------------------------


--6 inputs AND Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;   

ENTITY ANDGATE6 IS
	PORT(x, y, q, w, e, r : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ANDGATE6;	  

ARCHITECTURE and_arc6 OF ANDGATE6 IS
BEGIN
	z <= (((((x AND y) AND q) AND w) AND e) AND r) AFTER 9 NS;
END ARCHITECTURE and_arc6;							 
----------------------------------------


-- 3 inputs OR Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ORGATE3 IS
	PORT(x, y, q : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ORGATE3;

ARCHITECTURE or_arc3 OF ORGATE3 IS
BEGIN
	z <= ((x OR y) OR q) AFTER 9 NS;
END ARCHITECTURE or_arc3;		  
----------------------------------------


-- 4 inputs OR Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ORGATE4 IS
	PORT(x, y, q, w : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ORGATE4;

ARCHITECTURE or_arc4 OF ORGATE4 IS
BEGIN
	z <= (((x OR y) OR q) OR w) AFTER 9 NS;
END ARCHITECTURE or_arc4; 			  
----------------------------------------


-- 5 inputs OR Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ORGATE5 IS
	PORT(x, y, q, w, e : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ORGATE5;

ARCHITECTURE or_arc5 OF ORGATE5 IS
BEGIN						
	z <= ((((x OR y) OR q) OR w) OR e) AFTER 9 NS;
END ARCHITECTURE or_arc5;  				
----------------------------------------


-- 6 inputs OR Gate:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ORGATE6 IS
	PORT(x, y, q, w, e, r : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY ORGATE6;

ARCHITECTURE or_arc6 OF ORGATE6 IS
BEGIN						
	z <= (((((x OR y) OR q) OR w) OR e) OR r) AFTER 9 NS;
END ARCHITECTURE or_arc6;	 		   
----------------------------------------


-- 3 inputs XOR GATE:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;  

ENTITY XORGATE3 IS
	PORT(x, y, q : IN STD_LOGIC;
			z : OUT STD_LOGIC);
END ENTITY XORGATE3;

ARCHITECTURE xor_arc3 OF XORGATE3 IS
BEGIN
	z <= ((x XOR y) XOR q) AFTER 12 NS;
END ARCHITECTURE xor_arc3;		
----------------------------------------