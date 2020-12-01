----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2020 11:08:15 AM
-- Design Name: 
-- Module Name: fsm_edge_detector - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm_edge_detector is
    Port ( 	clk : in STD_LOGIC;
    		reset: in STD_LOGIC;
           	level : in STD_LOGIC;
           	tick : out STD_LOGIC);
end fsm_edge_detector;

architecture Behavioral of fsm_edge_detector is

type FSM is (zero, edge, one);
signal state_reg, state_next : FSM;

begin

process (clk, reset)
begin
	if reset = '1' then
		state_reg <= zero;
	elsif rising_edge(clk) then
		state_reg <= state_next;
	end if;
end process;

process (state_reg, level)
begin
	tick <= '0';
	state_next <= zero;
	case state_reg is
		when zero =>
			if level = '1' then
				state_next <= edge;
			end if;
		when edge =>
			tick <= '1';
			if level = '1' then
				state_next <= one;
			end if;
		when one =>
			if level = '1' then
				state_next <= one;
			end if;
	end case;

end process;


end Behavioral;
