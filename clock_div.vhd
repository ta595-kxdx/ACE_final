----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2026 07:36:14 PM
-- Design Name: 
-- Module Name: clock_div - Behavioral
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
-- arithmetic functions with Signed or Unsigned library
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div is
Port (
    clk_125MHz : in std_logic := '0';
    clk_25MHz : out std_logic := '0'

 );
end clock_div;

architecture Behavioral of clock_div is
signal clk_counter : std_logic_vector (25 downto 0) := (others => '0'); 
begin

process (clk_125MHz)
begin  
    if rising_edge(clk_125MHz) then
        if clk_counter = "00000000000000000000000100" then --25 in binary
            clk_25MHz <= '1';
            clk_counter <= (others => '0'); 
         else 
            clk_counter <= std_logic_vector(unsigned(clk_counter) + 1);
            clk_25MHz <= '0';
         end if;
    end if;
 end process; 

end Behavioral;


--"11101110011010110010100000" then --62,500,000 in binary (25 down to 0)