----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2020 10:03:24 AM
-- Design Name: 
-- Module Name: hex2seg - Behavioral
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

entity hex2seg is
	Port ( hex : in STD_LOGIC_VECTOR (3 downto 0);
	       seg : out STD_LOGIC_VECTOR (7 downto 0);
	       an : out STD_LOGIC_VECTOR (3 downto 0));
end hex2seg;

architecture Behavioral of hex2seg is

begin

an <= "0111";
seg(7) <= '1';

process (hex)
begin
	case hex is
		when "0000" => seg (6 downto 0) <= "1000000";
		when "0001" => seg (6 downto 0) <= "1111001";
		when "0010" => seg (6 downto 0) <= "0100100";
		when "0011" => seg (6 downto 0) <= "0110000";
		when "0100" => seg (6 downto 0) <= "0011001";
		when "0101" => seg (6 downto 0) <= "0010010";
		when "0110" => seg (6 downto 0) <= "0000010";
		when "0111" => seg (6 downto 0) <= "1111000";
		when "1000" => seg (6 downto 0) <= "0000000";
		when "1001" => seg (6 downto 0) <= "0010000";
		when "1010" => seg (6 downto 0) <= "0001000";
		when "1011" => seg (6 downto 0) <= "0000011";
		when "1100" => seg (6 downto 0) <= "1000110";
		when "1101" => seg (6 downto 0) <= "0100001";
		when "1110" => seg (6 downto 0) <= "0000110";
		when others => seg (6 downto 0) <= "0001110";
	end case;
end process;

end Behavioral;
