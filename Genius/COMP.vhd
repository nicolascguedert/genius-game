library ieee;
use ieee.std_logic_1164.all;

entity COMP IS 
PORT(
	seq_FPGA, seq_Usuario: IN std_logic_vector(63 DOWNTO 0);
	eq: OUT std_logic
 );
END COMP;

architecture rtl of COMP is
begin
    p: process(seq_FPGA, seq_Usuario)
    begin
        if (seq_FPGA = seq_Usuario) then
            eq <= '1';
        else
            eq <= '0';
        end if;
    end process; 
end rtl;