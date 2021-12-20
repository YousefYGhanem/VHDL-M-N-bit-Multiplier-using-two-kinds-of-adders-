-------------------------------------------------------
-- ADDERS LIBRARY
-------------------------------------------------------


-- FULL ADDER:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fullAdder IS
	PORT(x, y : IN STD_LOGIC;
		  cin : IN STD_LOGIC;
	  cout, s : OUT STD_LOGIC);
END ENTITY fullAdder;

ARCHITECTURE fullAdder_structural OF fullAdder IS
SIGNAL c1, c2, c3 : STD_LOGIC;
BEGIN
	gate1 : ENTITY work.XORGATE3 PORT MAP(x, y, cin, s);
	gate2 : ENTITY work.ANDGATE2 PORT MAP(x, y, c1);
	gate3 : ENTITY work.ANDGATE2 PORT MAP(x, cin, c2);
	gate4 : ENTITY work.ANDGATE2 PORT MAP(cin, y, c3);
	gate5 : ENTITY work.ORGATE3  PORT MAP(c1, c2, c3, cout);
		
END ARCHITECTURE fullAdder_structural;	   
-------------------------------------------------------------------


-- CARRY RIPPLE ADDER:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;	 

ENTITY nbit_rippleAdder IS  	
	PORT(x, y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  cin : IN STD_LOGIC;
 		    s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  		 cout : OUT STD_LOGIC);
END ENTITY nbit_rippleAdder;		   

ARCHITECTURE nbit_rippleAdder_structural OF nbit_rippleAdder IS
SIGNAL carry : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
	carry(0) <= cin;
    cout <= carry(4);
    gnr: FOR i IN 0 TO 3 GENERATE  
	f : ENTITY work.fullAdder(fullAdder_structural)
       		PORT MAP (x(i),y(i),carry(i),carry(i+1),s(i));
	END GENERATE gnr;
END ARCHITECTURE nbit_rippleAdder_structural;	 	  
-------------------------------------------------------------------



-- CARRY LOOK AHEAD ADDER:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;	 

ENTITY CLA_adder IS  
	PORT(x, y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  cin : IN STD_LOGIC;
 		    s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  		 cout : OUT STD_LOGIC);
END ENTITY CLA_adder;			


ARCHITECTURE CLA_adder_structural OF CLA_adder IS 
-- carry propagate
SIGNAL p 	: STD_LOGIC_VECTOR(3 DOWNTO 0);
-- carry generate
SIGNAL g 	: STD_LOGIC_VECTOR(3 DOWNTO 0);
-- CLA Generator
SIGNAL c    : STD_LOGIC_VECTOR(4 DOWNTO 0); 	  

SIGNAL p0c0 : STD_logic; 

SIGNAL p1g0 : STD_logic;	
SIGNAL p1p0c0 : STD_logic;

SIGNAL p2g1 : STD_logic;	
SIGNAL p2p1g0 : STD_logic;	
SIGNAL p2p1p0c0 : STD_logic;

SIGNAL p3g2 : STD_logic;	
SIGNAL p3p2g1 : STD_logic;	
SIGNAL p3p2p1g0 : STD_logic;	
SIGNAL p3p2p1p0c0 : STD_logic;	

BEGIN
	carry_Propagate: FOR i IN 3 DOWNTO 0 GENERATE 
		carry_Prop_Loop: ENTITY WORK.XORGATE2(xor_arc2) 
			PORT MAP(x(i), y(i), p(i));
	END GENERATE carry_Propagate;  
	
	carry_Generate: FOR i IN 3 DOWNTO 0 GENERATE 
		carry_Gene_Loop: ENTITY WORK.ANDGATE2(and_arc2) 
			PORT MAP(x(i), y(i), g(i)); 
	END GENERATE carry_Generate;
	
	c(0) <= cin; 			
	

	p0c0_out: ENTITY WORK.ANDGATE2(and_arc2) 
		PORT MAP(p(0), c(0), p0c0);   
		
	c1: ENTITY WORK.ORGATE2(or_arc2) 
			PORT MAP(p0c0, g(0), c(1)); 
	
	
			
	p1g0_out: ENTITY WORK.ANDGATE2(and_arc2) 
		PORT MAP(p(1), g(0), p1g0); 		
	
	p1p0c0_out: ENTITY WORK.ANDGATE3(and_arc3) 
		PORT MAP(p(1), p(0), c(0), p1p0c0); 	 
		
	c2: ENTITY WORK.ORGATE3(or_arc3) 
		PORT MAP(g(1), p1g0, p1p0c0, c(2)); 
		
		
		
	p2g1_out: ENTITY WORK.ANDGATE2(and_arc2) 
		PORT MAP(p(2), g(1), p2g1);
	
	p2p1g0_out: ENTITY WORK.ANDGATE3(and_arc3) 
		PORT MAP(p(2), p(1), g(0), p2p1g0); 
		
	p2p1p0c0_out: ENTITY WORK.ANDGATE4(and_arc4) 
		PORT MAP(p(2), p(1), p(0), c(0), p2p1p0c0); 
		
	c3: ENTITY WORK.ORGATE4(or_arc4) 
		PORT MAP(g(2), p2g1, p2p1g0, p2p1p0c0, c(3)); 
		
	   
		
	p3g2_out: ENTITY WORK.ANDGATE2(and_arc2) 
		PORT MAP(p(3), g(2), p3g2);
	
	p3p2g1_out: ENTITY WORK.ANDGATE3(and_arc3) 
		PORT MAP(p(3), p(2), g(1), p3p2g1); 
		
	p3p2p1g0_out: ENTITY WORK.ANDGATE4(and_arc4) 
		PORT MAP(p(3), p(2), p(1), g(0), p3p2p1g0); 
		
	p3p2p1p0c0_out: ENTITY WORK.ANDGATE5(and_arc5) 
		PORT MAP(p(3), p(2), p(1), p(0), c(0), p3p2p1p0c0);		

	c4: ENTITY WORK.ORGATE5(or_arc5	) 
		PORT MAP(g(3), p3g2, p3p2g1, p3p2p1g0, p3p2p1p0c0, c(4));
			
	cout <= c(4);					-- output carry	 
	
    sum : FOR i IN 0 TO 3 GENERATE  
		 gate : ENTITY WORK.XORGATE2(xor_arc2)
			 PORT MAP (p(i),c(i),s(i));   
			 
	END GENERATE sum;
	
END ARCHITECTURE CLA_adder_structural; 
-------------------------------------------------------------------
