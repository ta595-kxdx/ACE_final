----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2026 08:21:46 PM
-- Design Name: 
-- Module Name: debounce - Behavioral
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

entity debounce is
Port (clk: in std_logic;
      btn: in std_logic := '0';
      dbnc: out std_logic := '0' );
end debounce;

architecture Behavioral of debounce is
signal shift_reg:std_logic_vector(1 downto 0) := (others => '0');
signal success_count: unsigned(22 downto 0) := (others => '0');
signal found : std_logic :='0';
begin

process(clk)
begin
if rising_edge(clk) then

        shift_reg(1) <= shift_reg(0);
        shift_reg(0) <= btn;
        if shift_reg(1) = '1' then
            if success_count = ("1001100010010110100000") then
                dbnc <= '1';
                found <='1';
            else
                success_count <= (success_count)+1;
                 dbnc <= '0';
            end if;
        else
            success_count <= (others => '0');
             dbnc <= '0';
        end if;
     end if;

end process;

end Behavioral;

--'"1110011101101001100000 (we want 2500000)
--1001100010010110100000 (21 downto 0)