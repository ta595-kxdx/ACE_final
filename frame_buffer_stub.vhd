----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2026 01:23:44 PM
-- Design Name: 
-- Module Name: frame_buffer_stub - Behavioral
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

entity frame_buffer_stub is
    Port (clk : in std_logic;
         pixel_valid: in std_logic;
         pixel_data : in std_logic_vector (15 downto 0));
end frame_buffer_stub;

architecture Behavioral of frame_buffer_stub is
begin

    process (clk)
    begin
        if rising_edge(clk) then
            if pixel_valid = '1' then
                null;
            end if;
        end if;
    end process;

end Behavioral;
