---------------------------------------------------------------------------
-- Test benches
---------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

ENTITY testMultiplier IS
END testMultiplier; 	

-- test bench for ripple based multiplier:
ARCHITECTURE test_ripple_multiplier OF testMultiplier IS  

SIGNAL clk : std_logic :='0';
SIGNAL inputA : std_logic_vector (3 DOWNTO 0);
SIGNAL inputB : std_logic_vector (5 DOWNTO 0);
SIGNAL generatedResult : std_logic_vector (9 DOWNTO 0);
SIGNAL multiplierResult : std_logic_vector (9 DOWNTO 0);

BEGIN

	clk <= NOT clk AFTER 100 ns;
	exp: ENTITY work.Gen(Gen_struct) PORT MAP (clk,inputA,inputB,generatedResult);	 
		ripple : ENTITY work.multiplier(multiplier_ripple_struct) PORT MAP (inputB,inputA,multiplierResult);	
			compare : ENTITY work.TestAnalyzer(analyzer_struct) PORT MAP (clk,generatedResult,multiplierResult);
			END ARCHITECTURE test_ripple_multiplier; 
			-----------------------------------------------------------------------------
			
-- test bench for carry look ahead based multiplier:			
ARCHITECTURE test_lookAhead_multiplier OF testMultiplier IS  

SIGNAL clk : std_logic :='0';
SIGNAL inputA : std_logic_vector (3 DOWNTO 0);
SIGNAL inputB : std_logic_vector (5 DOWNTO 0);
SIGNAL generatedResult : std_logic_vector (9 DOWNTO 0);
SIGNAL multiplierResult : std_logic_vector (9 DOWNTO 0);

BEGIN

	clk <= NOT clk AFTER 120 ns;
	exp: ENTITY work.Gen(Gen_struct) PORT MAP (clk,inputA,inputB,generatedResult);	 
		cla0 : ENTITY work.multiplier(multiplier_cla_struct) PORT MAP (inputB,inputA,multiplierResult);	
			compare : ENTITY work.TestAnalyzer(analyzer_struct) PORT MAP (clk,generatedResult,multiplierResult);
			END ARCHITECTURE test_lookAhead_multiplier; 	
			-----------------------------------------------------------------------------