library ieee;
use ieee.std_logic_1164.all;

ENTITY MUX2X1_7bits IS
PORT(
	SEL: IN std_logic;
    ENT0, ENT1: IN std_logic_vector(6 DOWNTO 0);
    output: OUT std_logic_vector(6 DOWNTO 0)
);
END MUX2X1_7bits;
architecture rtl of MUX2X1_7bits is
begin
    with SEL select output <= ENT0 when '0',
                              ENT1 when others;
end rtl;