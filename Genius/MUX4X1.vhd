library ieee;
use ieee.std_logic_1164.all;

ENTITY MUX4X1 IS
PORT(level: IN std_logic_vector(1 DOWNTO 0);
    CL1, CL2, CL3, CL4: IN std_logic;
    CLKHZ: OUT std_logic
);
END MUX4X1;
architecture rtl of MUX4X1 is
begin
    with level select CLKHZ <= CL1 when "00",
                               CL2 when "01",
                               CL3 when "10",
                               CL4 when others;
end rtl;