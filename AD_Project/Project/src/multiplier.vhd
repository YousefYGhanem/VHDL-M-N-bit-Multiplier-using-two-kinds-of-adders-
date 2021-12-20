---------------------------------------------------------------	
-- Multiplier
---------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;  

ENTITY multiplier IS 
	-- j * k => (j-1) * k-bit adders
	GENERIC(j: positive := 6 ; k: positive := 4);		   
	PORT(x  : IN  std_logic_vector((j - 1) DOWNTO 0);
		 y  : IN  std_logic_vector((k - 1) DOWNTO 0);
		res : OUT std_logic_vector((j + k - 1) DOWNTO 0));
END ENTITY multiplier;									  

-- Multiplier built by ripple adders:
ARCHITECTURE multiplier_ripple_struct OF multiplier IS
TYPE d2 IS ARRAY (j-1 DOWNTO 0 ) OF std_logic_vector (k-1 DOWNTO 0);  
SIGNAL ands, sum, shiftedsum: d2;
SIGNAL cout : std_logic_vector (j-1 DOWNTO 0);
BEGIN
	x_input: 
		FOR i IN 0 TO j - 1 GENERATE
			y_input: 
			FOR m IN 0 TO k - 1 GENERATE 
				andLoop: ENTITY WORK.ANDGATE2(and_arc2)
							PORT MAP(x(i), y(m), ands(i)(m)); 
				END GENERATE y_input;
			END GENERATE x_input;
				
				sum(0) <= ands(0);
				cout(0) <= '0';
	muliplication:
		FOR i IN 0 TO j-2 GENERATE
			res(i) <= sum(i)(0); 		
			shiftedsum(i) <= cout(i) & sum(i)(k-1 DOWNTO 1);	
						
			adder: ENTITY work.nbit_rippleadder(nbit_rippleadder_structural) 
					PORT MAP (shiftedsum(i), ands(i+1), '0', sum(i+1), cout(i+1));				
					END GENERATE muliplication;		    
			
				res(j+k-1 DOWNTO j-1) <= cout(j-1) & sum(j-1);
END ARCHITECTURE multiplier_ripple_struct;		 
-------------------------------------------------------------------------------------------


-- Multiplier built by look ahead adders:
ARCHITECTURE multiplier_cla_struct OF multiplier IS
TYPE d2 IS ARRAY (j-1 DOWNTO 0 ) OF std_logic_vector (k-1 DOWNTO 0);  
SIGNAL ands, sum, shiftedsum: d2;
SIGNAL cout : std_logic_vector (j-1 DOWNTO 0);
BEGIN	
	x_input: 
		FOR i IN 0 TO j - 1 GENERATE
			y_input: 
			FOR m IN 0 TO k - 1 GENERATE 
				andLoop: ENTITY WORK.ANDGATE2(and_arc2) 
							PORT MAP(x(i), y(m), ands(i)(m)); 
				END GENERATE y_input;
			END GENERATE x_input;
				
				sum(0) <= ands(0);
				cout(0) <= '0';
	muliplication:
					FOR i IN 0 TO j-2 GENERATE
						res(i) <= sum(i)(0); 		
						shiftedsum(i) <= cout(i) & sum(i)(k-1 DOWNTO 1);	
						
						adder: ENTITY work.cla_adder(cla_adder_structural) 
							PORT MAP (shiftedsum(i), ands(i+1), '0', sum(i+1), cout(i+1));	
							END GENERATE muliplication;		    
			
				res(j+k-1 DOWNTO j-1) <= cout(j-1) & sum(j-1);		
END ARCHITECTURE multiplier_cla_struct;
-------------------------------------------------------------------------------------------