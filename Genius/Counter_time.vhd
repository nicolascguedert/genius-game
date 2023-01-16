library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity Counter_time IS
PORT(CLKT: IN std_logic;
    R: IN std_logic;
    E: IN std_logic;
    TEMPO: OUT std_logic_vector(3 downto 0);
    end_time: OUT std_logic
);
END Counter_time;

architecture rtl of Counter_time is
signal data: std_logic_vector(3 downto 0):= "1010";
signal CONTADOR: std_logic_vector(3 downto 0):= "0000";
begin
    p: process (CLKT, R, E, data)
    begin
        if R= '1' then
            CONTADOR<= "0000";
				end_time <= '0';
        elsif (CLKT'event and CLKT = '1') then
            if E = '1' then
		        CONTADOR <= CONTADOR + 1;
		        if CONTADOR = data then
			        end_time <= '1';
	        	else
			        end_time <= '0';
		        end if;
	       end if;
	    end if;
    end process;
    TEMPO <= CONTADOR;
end rtl;