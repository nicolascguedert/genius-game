library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity Counter_FPGA IS
PORT(clk: IN std_logic;
    R: IN std_logic;
    E : IN std_logic;
	 data: IN std_logic_vector(3 DOWNTO 0);
	 tc: OUT std_logic;	
    SEQFPGA: OUT std_logic_vector(3 DOWNTO 0)
);
END Counter_FPGA;

architecture rtl of Counter_FPGA is
signal CONTADOR: std_logic_vector(3 downto 0):= "0000";
begin
    p: process (clk, R, E)
    begin
        if R= '1' then
            CONTADOR<= "0000";
				tc <= '0';
        elsif (clk'event and clk = '1') then
            if E = '1' then
		        CONTADOR <= CONTADOR + 1;
		        if CONTADOR = data then
			        tc <= '1';
	        	else
			        tc <= '0';
		        end if;
	       end if;
	    end if;
    end process;
    SEQFPGA <= CONTADOR;
end rtl;