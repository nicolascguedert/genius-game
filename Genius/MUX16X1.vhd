library ieee;
use ieee.std_logic_1164.all;

ENTITY MUX16X1 IS
PORT(sel: IN std_logic_vector(3 DOWNTO 0);
    F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16: IN std_logic;
    CLKHZ: OUT std_logic
);
END MUX16X1;
architecture rtl of MUX16X1 is
begin
    with sel select CLKHZ <= F1 when  "0000",
                             F2 when  "0001",
                             F3 when  "0010",
                             F4 when  "0011",
                             F5 when  "0100",
                             F6 when  "0101",
                             F7 when  "0110",
                             F8 when  "0111",
                             F9 when  "1000",
                             F10 when "1001",
                             F11 when "1010",
                             F12 when "1011",
                             F13 when "1100",
                             F14 when "1101",
                             F15 when "1110",
                             F16 when others;
end rtl;