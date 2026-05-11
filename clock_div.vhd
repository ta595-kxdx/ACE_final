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
    generic (
        divide_by : integer := 256);
    Port (
        clk_in : in std_logic := '0';
        rst_n : in std_logic;
        clk_out : out std_logic := '0'

    );
end clock_div;

architecture Behavioral of clock_div is
    signal clk_counter : integer := 0;
    signal clk_reg : std_logic := '0';
begin

    process (clk_in, rst_n)
    begin
        if rst_n = '0' then
            clk_counter <= 0;
            clk_reg  <= '0';
        
    elsif rising_edge(clk_in) then 
        if clk_counter = DIVIDE_BY-1 then
        clk_counter <= 0;
        clk_reg <= not clk_reg;
        
     else 
        clk_counter <= clk_counter + 1 ;
        end if;
        
        end if;
    end process;
clk_out <= clk_reg;
end Behavioral;
