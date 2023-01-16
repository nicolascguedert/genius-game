LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Controle IS
PORT(
	-- Entradas de controle
	CLOCK: IN std_logic;
	enter: IN std_logic;
	reset: IN std_logic;
	-- Entradas de status
	end_FPGA, end_User, end_time, win, match: IN std_logic;
	-- Saídas de comandos
	R1, R2, E1, E2, E3, E4: OUT std_logic;
	SEL: OUT std_logic
	-- Saídas de controle
);
END Controle;

ARCHITECTURE arc OF Controle IS
	TYPE STATES IS (Init, Setup, Play_FPGA, Play_User, Check, Next_Round, Result);
	SIGNAL EA, PE: STATES;
BEGIN
	PR1: process (CLOCK, reset)
	begin
	    if (reset = '1') then
	        EA <= Init;
	   elsif (CLOCK'event AND CLOCK = '1') then
	        EA <= PE;
	   end if;
	end process;
	
	PR2: process (EA, enter, end_FPGA, end_User, end_time, win, match)
	begin
	    case EA is
	        when Init =>
    	        R1 <= '1';
    	        R2 <= '1';
    	        E1 <= '0';
    	        E2 <= '0';
    	        E3 <= '0';
    	        E4 <= '0';
    	        SEL <= '0';
    	        PE <= Setup;
	        
	        when Setup =>
    	        R1 <= '0';
    	        R2 <= '0';
    	        E1 <= '1';
    	        E2 <= '0';
    	        E3 <= '0';
    	        E4 <= '0';
    	        SEL <= '0';
    	        if enter = '0' then
    	            PE <= Setup;
    	        else
    	            PE <= Play_FPGA;
    	        end if;
    	        
	        when Play_FPGA =>
    	        R1 <= '0';
    	        R2 <= '0';
    	        E1 <= '0';
    	        E2 <= '0';
    	        E3 <= '1';
    	        E4 <= '0';
    	        SEL <= '0';
    	        if end_FPGA = '0' then
    	            PE <= Play_FPGA;
    	        elsif end_FPGA = '1' then
    	            PE <= Play_User;
    	        end if;
	        
	        when Play_User =>
	            R1 <= '0';
    	        R2 <= '0';
    	        E1 <= '0';
    	        E2 <= '1';
    	        E3 <= '0';
    	        E4 <= '0';
    	        SEL <= '0';
        	    if end_User = '0' and end_Time = '0' then
                    PE <= Play_User;                                
                elsif end_Time = '1' then
                    PE <= Result;                                   
                elsif end_User = '1' then
                    PE <= Check;                                    
                end if;
	        
	        when Check =>
    	        R1 <= '0';
    	        R2 <= '0';
    	        E1 <= '0';
    	        E2 <= '0';
    	        E3 <= '0';
    	        SEL <= '0';
        	    if match = '0' then
    	            PE <= Result;
    	            E4 <= '0';
    	        elsif match = '1' then
    	            PE <= Next_Round;
    	            E4 <= '1';
    	        end if;
	        
	        when Next_Round =>
    	        R1 <= '0';
    	        R2 <= '1';
    	        E1 <= '0';
    	        E2 <= '0';
    	        E3 <= '0';
    	        E4 <= '0';
    	        SEL <= '0';
    	        if win = '0' then
    	            PE <= Play_FPGA;
    	        elsif win = '1' then
    	            PE <= Result;
    	        end if;
	        
	        when Result =>
    	        R1 <= '0';
    	        R2 <= '0';
    	        E1 <= '0';
    	        E2 <= '0';
    	        E3 <= '0';
    	        E4 <= '0';
    	        SEL <= '1';
    	        PE <= Result;
	    end case;
	end process;
END arc;