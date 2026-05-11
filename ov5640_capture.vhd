----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2026 12:08:11 PM
-- Design Name: 
-- Module Name: ov5640_capture - Behavioral
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

entity ov5640_capture is
    Port (pclk : in std_logic;
         rst_n : in std_logic;
         vsync : in std_logic;
         href : in std_logic;
         cam_data : in std_logic_vector(7 downto 0);
         pixel_valid : out std_logic;
         pixel_data : out std_logic_vector(15 downto 0);
         frame_done : out std_logic);
end ov5640_capture;

architecture Behavioral of ov5640_capture is
    signal byte_state : std_logic := '0';
    signal upper_byte : std_logic_vector(7 downto 0);

begin

    process(pclk, rst_n)
    begin

        if rst_n = '0' then
            byte_state <= '0';
            pixel_valid <= '0';
            frame_done <= '0';

        elsif rising_edge(pclk) then
            frame_done <= '0';
            pixel_valid <= '0';

            if vsync = '1' then
                frame_done <= '1';
                byte_state <= '0';

            elsif href = '1' then
                if byte_state = '0' then
                    upper_byte <= cam_data;
                    byte_state <= '1';

                else
                    pixel_data <= upper_byte & cam_data ;
                    pixel_valid <= '1';
                    byte_state <= '0';
                end if;
            end if;
        end if;

    end process;
end Behavioral;
