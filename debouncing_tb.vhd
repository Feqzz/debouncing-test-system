----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2020 02:39:37 PM
-- Design Name: 
-- Module Name: debouncing_tb - Behavioral
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

entity debouncing_tb is
--  Port ( );
end debouncing_tb;

architecture Behavioral of debouncing_tb is

component fsm_debouncer
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw : in STD_LOGIC;
           db : out STD_LOGIC);
end component fsm_debouncer;

constant clk_period : time := 4 ns;
signal clk_tb, reset_tb, sw_tb, db_tb : STD_LOGIC;

begin

UUT: fsm_debouncer
port map(clk => clk_tb, reset => reset_tb, sw => sw_tb, db => db_tb);

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
	sw_tb <= '1';
	wait for 20 ns;
	sw_tb <= '0';
	wait for 15 ns;
	sw_tb <= '1';
	wait for 8 ns;
	sw_tb <= '0';
	wait for 15 ns;
	sw_tb <= '1';
	wait for 50 ns;
	reset_tb <= '1';
	wait;
end process;


end Behavioral;
