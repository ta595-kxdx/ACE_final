----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2026 01:12:43 PM
-- Design Name: 
-- Module Name: jysk_spi_adc - Behavioral
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

entity jysk_spi_adc is
    Port (clk : in std_logic;
         rst_n : in std_logic;
         miso : in std_logic;
         mosi : out std_logic;
         sclk : out std_logic;
         cs : out std_logic;
         adc_data : out std_logic_vector ( 9 downto 0) );
end jysk_spi_adc;

architecture Behavioral of jysk_spi_adc is
    signal clk_div : unsigned (7 downto 0) := (others => '0');
    signal spi_clk : std_logic := '0';
    signal bit_count : integer range 0 to 15 := 0;
    signal shift_reg : std_logic_vector (15 downto 0) := (others => '0');

begin

    process (clk, rst_n)
    begin

        if rst_n = '0' then
            clk_div <=  (others => '0');
            spi_clk <= '0';
            bit_count <= 0;
            shift_reg <= (others => '0');

        elsif rising_edge(clk) then
            clk_div <= clk_div + 1;

            if clk_div = 0 then
                spi_clk <= not spi_clk;

                if spi_clk = '1' then
                    shift_reg <= shift_reg (14 downto 0) & miso;
                    if bit_count = 15 then
                        bit_count <= 0;
                    else
                        bit_count <= bit_count + 1;

                    end if ;
                end if;
            end if;
        end if;
    end process;
    
    sclk <= spi_clk;
    cs <= '0';
    mosi <= '0';

end Behavioral;
