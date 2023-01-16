library ieee;
use ieee.std_logic_1164.all;

ENTITY MUX4X1_4bits IS
PORT(
	SEL: IN std_logic_vector(1 DOWNTO 0);
    ENT0, ENT1, ENT2, ENT3: IN std_logic_vector(3 DOWNTO 0);
    output: OUT std_logic_vector(3 DOWNTO 0)
);
END MUX4X1_4bits;
architecture rtl of MUX4X1_4bits is
begin
    with SEL select output <= ENT0 when "00",
                              ENT1 when "01",
                              ENT2 when "10",
                              ENT3 when others;
end rtl;