----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 07:49:15 PM
-- Design Name: 
-- Module Name: ssd - Behavioral
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

entity ssd is
    Port (clk : std_logic;
         an : in  STD_LOGIC_VECTOR (3 downto 0);   -- Controls which position of the seven segment display to display
         seg : in  STD_LOGIC_VECTOR (6 downto 0); -- digit to display on the seven segment display );
         jb_p : out  STD_LOGIC_VECTOR (3 downto 0); -- PmodSSD is designed to be connected to JB/C
         jc_p : out  STD_LOGIC_VECTOR (3 downto 0));

end ssd;

architecture Behavioral of ssd is

begin

    process(clk)
    begin
        case seg is
            when "0000000" =>
                jb_p <= (others => '0');
                jc_p <= (others => '0');
            when "0000001" => jb_p <= "0110"; jc_p <= (others => '0');
            when "0000010" => jb_p <= "1101"; jc_p <= "1100";
            when others => jb_p <= (others => '0');
                jc_p <= (others => '0');
        end case;
    end process;
end Behavioral;
