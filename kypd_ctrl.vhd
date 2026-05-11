----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 07:31:12 PM
-- Design Name: 
-- Module Name: kypd_ctrl - Behavioral
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

entity kypd_ctrl is
    Port (clk : in std_logic;
         rst_n : in std_logic;
         row_in : in std_logic_vector(3 downto 0);
         col_out : out std_logic_vector(3 downto 0);
         key_value : out std_logic_vector(3 downto 0);
         key_valid : out std_logic );
end kypd_ctrl;

architecture Behavioral of kypd_ctrl is
    signal scan_counter : unsigned (15 downto 0) := (others => '0');
    signal col_select : unsigned (1 downto 0) := (others => '0');

begin

    process(clk, rst_n)
    begin

        if rst_n = '0' then
            scan_counter <= (others => '0');
            col_select <= ("00");
            key_valid <= '0';

        elsif rising_edge(clk) then
            scan_counter <= scan_counter + 1;

            if scan_counter = 0 then
                col_select <= col_select + 1;
            end if;

            case col_select is
                when "00" => col_out <= "1110";
                when "01" => col_out <= "1101";
                when "10" => col_out <= "1011";
                when others => col_out <= "0111";
            end case;

            key_valid <= '0';

            if row_in /= "1111" then
                key_valid <= '1';
                key_value <= std_logic_vector(col_select) & row_in(1 downto 0);
            end if;
        end if;

    end process;

end Behavioral;
