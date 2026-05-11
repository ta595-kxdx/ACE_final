----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 07:31:12 PM
-- Design Name: 
-- Module Name: jstk_ctrl - Behavioral
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

entity jstk_ctrl is
    Port (clk : in std_logic;
         rst_n : in std_logic;
         miso : in std_logic;
         mosi : out std_logic;
         sclk : out std_logic;
         cs : out std_logic;
         joy_x : out std_logic_vector(9 downto 0);
         joy_y : out std_logic_vector(9 downto 0));
end jstk_ctrl;

architecture Behavioral of jstk_ctrl is
    signal adc_x : std_logic_vector(9 downto 0);
    signal adc_y :  std_logic_vector(9 downto 0);

begin
    xy_reader : entity work.jysk_spi_adc
        port map (
            clk => clk,
            rst_n => rst_n,
            miso => miso,
            mosi => mosi,
            sclk => sclk,
            cs => cs,
            adc_data => adc_x);

    adc_y <= not adc_x;

    joy_x <= adc_x;
    joy_y <= adc_y;

end Behavioral;
