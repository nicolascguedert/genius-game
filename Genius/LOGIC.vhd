library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity LOGICA IS
PORT(
     REG_SetupLEVEL: IN std_logic_vector(1 DOWNTO 0);
     ROUND: IN std_logic_vector(3 DOWNTO 0);
	 REG_SetupMAPA: IN std_logic_vector(1 DOWNTO 0);
	 POINTS: OUT std_logic_vector(7 DOWNTO 0)
);
END LOGICA;

architecture rtl of LOGICA is
signal a, b: std_logic_vector(7 downto 0);
begin
    
    POINTS <= REG_SetupLEVEL & ROUND & REG_SetupMAPA;
    
end rtl;