----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2020 06:07:43 PM
-- Design Name: 
-- Module Name: edge_detector_tb - Behavioral
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

entity edge_detector_tb is
--  Port ( );
end edge_detector_tb;

architecture Behavioral of edge_detector_tb is

component fsm_edge_detector
    Port ( 	clk : in STD_LOGIC;
    		reset : in STD_LOGIC;
    		level : in STD_LOGIC;
          	tick : out STD_LOGIC);
end component fsm_edge_detector;

signal clk_tb, reset_tb, level_tb, tick_tb : STD_LOGIC;
constant clk_period : time := 4 ns;

begin

UUT: fsm_edge_detector
port map (clk => clk_tb, reset => reset_tb, level => level_tb, tick => tick_tb);

process
begin
	clk_tb <= '1';
	wait for (clk_period / 2);
	clk_tb <= '0';
	wait for (clk_period / 2);
end process;

process
begin
	reset_tb <= '0';
	level_tb <= '0';
	wait for 3 ns;
	level_tb <= '1';
	wait for 8 ns;
	level_tb <= '0';
	wait for 2 ns;
	level_tb <= '1';
	wait for 3 ns;
	reset_tb <= '1';
	wait;
end process;

end Behavioral;
