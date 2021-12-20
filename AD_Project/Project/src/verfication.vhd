--------------------------------------------------
--  verification 
-------------------------------------------------- 



--Generator:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL; 

ENTITY Gen IS
    PORT( 
    clk: IN STD_LOGIC;
    s1: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    s2: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    Result: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
    ); 
END;

ARCHITECTURE Gen_struct OF Gen IS

  BEGIN 
  PROCESS 
  VARIABLE summation :Integer :=0;
  BEGIN

  FOR I IN 0 TO 15 LOOP
  FOR J IN 0 TO 63 LOOP

    s1 <= CONV_STD_LOGIC_VECTOR(I , 4);
    s2 <= CONV_STD_LOGIC_VECTOR(J , 6);
    summation := i*j;
    Result <= CONV_STD_LOGIC_VECTOR(summation , 10);

 WAIT UNTIL rising_edge(clk);
 END LOOP;
 END LOOP;
 WAIT;
 END PROCESS;
 
END ARCHITECTURE Gen_struct;
------------------------------------------------------


--Test analyzer:
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
ENTITY TestAnalyzer IS
PORT ( clk: IN STD_LOGIC;
expectedResult: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
actualResult: IN STD_LOGIC_VECTOR(9 DOWNTO 0));

END ENTITY TestAnalyzer;

ARCHITECTURE analyzer_struct OF TestAnalyzer IS
BEGIN
PROCESS(clk)
BEGIN
IF rising_edge(clk) THEN

-- comparing real result to the one from multiplier
ASSERT (actualResult = expectedResult(9 downto 0) );
REPORT "multiplier result doesn't match expected result!!"
SEVERITY warning;
END IF;
END PROCESS;
END ARCHITECTURE analyzer_struct;
------------------------------------------------------


