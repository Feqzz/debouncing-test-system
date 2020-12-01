----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2020 03:12:29 PM
-- Design Name: 
-- Module Name: mod_m_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_m_counter is
	generic ( N : INTEGER := 4;
			  M : INTEGER := 16);

    Port ( rst 		: in STD_LOGIC;
           clk 		: in STD_LOGIC;
           en 		: in STD_LOGIC;
           q 		: out STD_LOGIC_VECTOR ((N - 1) downto 0);
           max_tick : out STD_LOGIC);
end mod_m_counter;

architecture Behavioral of mod_m_counter is

signal r_reg, r_next : UNSIGNED ((N - 1) downto 0);

begin

	process (rst, clk, en)
	begin
		if (rst = '1') then
			r_reg <= (others => '0');
		elsif (rising_edge(clk)) then
			if (en = '1') then
				r_reg <= r_next;
			end if;
		end if;
	end process;

	process (r_reg)
	begin
		if (r_reg = (M - 1)) then
			r_next <= (others => '0');
			max_tick <= '1';
		else
			r_next <= r_reg + 1;
			max_tick <= '0';
		end if;
	end process;
	
	q <= STD_LOGIC_VECTOR (r_reg);

end Behavioral;
