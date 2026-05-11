----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2026 12:08:34 PM
-- Design Name: 
-- Module Name: ov5640_sccb_master - Behavioral
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

entity ov5640_sccb_master is
    Port ( clk : in std_logic;
         rst_n : in std_logic;
         sccb_scl : out std_logic;
         sccb_sda : inout std_logic;
         config_done : out std_logic);
end ov5640_sccb_master;

architecture Behavioral of ov5640_sccb_master is

    signal counter: unsigned (23 downto 0) := (others => '0');
    signal scl_reg : std_logic := '1';
    signal sda_reg : std_logic := '1';

begin
    process(clk, rst_n)
    begin

        if rst_n = '0' then
            counter <= (others => '0');
            scl_reg <= '1';
            sda_reg <= '1';
        elsif rising_edge(clk) then
            counter <= counter + 1;

            if counter < x"7FFFFF" then -- 8,388,607 in decimal
                scl_reg <= counter(10);
                sda_reg <= counter(12);
            else
                config_done <= '1';
                scl_reg <= '1';
                sda_reg <= '1';
            end if;
        end if;
    end process;
    sccb_scl <= scl_reg;
    sccb_sda <= sda_reg;
end Behavioral;
