----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2026 11:21:19 AM
-- Design Name: 
-- Module Name: Pcam_top - Behavioral
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

entity Pcam_top is
 Port ( 
 
    clk: in std_logic;
    rst: in std_logic;
    pcam_pclk: in std_logic;
    pcam_href: in std_logic;
    pcam_vsync: in std_logic;
    pcam_data: in std_logic_vector (7 downto 0);
    pcam_scl: out std_logic;
    pcam_xclk: out std_logic;
    pcam_rst: out std_logic;
    pcam_pwdn: out std_logic;
    pcam_sda: inout std_logic;
    led : out std_logic_vector (3 downto 0));
end Pcam_top;

architecture Behavioral of Pcam_top is
signal xclk : std_logic := '0';
signal pixel_valid : std_logic;
signal pixel_data : std_logic_vector (15 downto 0);
signal frame_done : std_logic;
begin


end Behavioral;
