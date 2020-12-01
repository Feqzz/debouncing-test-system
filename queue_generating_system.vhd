----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2020 10:09:39 AM
-- Design Name: 
-- Module Name: queue_generating_system - Behavioral
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

entity queue_generating_system is
    Port ( 	rst : in STD_LOGIC;
    		clk : in STD_LOGIC;
           	button : in STD_LOGIC;
           	seg : out STD_LOGIC_VECTOR (7 downto 0);
           	an : out STD_LOGIC_VECTOR (3 downto 0));
end queue_generating_system;

architecture Behavioral of queue_generating_system is

signal db, ed: STD_LOGIC;
signal hex : STD_LOGIC_VECTOR (3 downto 0);

begin

debouncing_circuit: entity work.fsm_debouncer(Behavioral)
port map (clk => clk, reset => rst, sw => button, db => db);

edge_detector: entity work.fsm_edge_detector(Behavioral)
port map (clk => clk, reset => rst, level => db, tick => ed);

mod_10_counter: entity work.mod_m_counter(Behavioral)
generic map (N => 4, M => 10)
port map (rst => rst, clk => clk, en => ed, q => hex, max_tick => open);

hex2seg: entity work.hex2seg(Behavioral)
port map (hex => hex, seg => seg, an => an);

end Behavioral;
