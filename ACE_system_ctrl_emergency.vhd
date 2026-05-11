----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2026 11:31:44 AM
-- Design Name: 
-- Module Name: ACE_system_ctrl - Behavioral
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

entity ACE_system_ctrl is
Port (    clk: in std_logic;
     rst_n: in std_logic;

     pcam_sda: inout std_logic;
     pcam_scl: out std_logic;
     pcam_xclk: out std_logic;
     pcam_rst: out std_logic;
     pcam_pwdn: out std_logic;

     js_miso : in std_logic;
     js_mosi : out std_logic;
     js_sclk : out std_logic;
     js_cs : out std_logic;

     kypd_rows : in std_logic_vector(3 downto 0);
     kypd_cols : in std_logic_vector(3 downto 0);

     led : out std_logic_vector (7 downto 0));
    
    
end ACE_system_ctrl;

architecture Behavioral of ACE_system_ctrl is
signal cam_xclk : std_logic;

signal pixel_valid : std_logic;
signal pixel_data : std_logic_vector(15 downto 0);
signal frame_done : std_logic;

signal joy_x : std_logic_vector (9 downto 0);
signal joy_y : std_logic_vector (9 downto 0);

signal kypd_values :std_logic_vector (3 downto 0);
signal kypd_valid : std_logic;

begin

clk_div_inst : entity work.clock_div
    generic map( divide_by => 5)
    port map ( 
    clk_in => clk,
    rst_n => rst_n,
    clk_out => cam_xclk);
    
pcam_xclk <= cam_xclk;


sccb_inst : entity work.ov5640_sccb_master
port map (
clk => clk,
rst_n => rst_n,
sccb_scl => pcam_scl,
sccb_sda => pcam_sda,
config_done => led(0));


-- ov5640_capture removed for MIPI migration
joystick_inst : entity work.jstk_ctrl
port map(
clk => clk,
rst_n => rst_n,
miso => js_miso,
mosi => js_mosi,
sclk => js_sclk,
cs => js_cs,
joy_x => joy_x, 
joy_y => joy_y);

keypad_inst :entity work.kypd_ctrl
port map (
clk => clk,
rst_n => rst_n,
row_in => kypd_rows,
col_out => kypd_cols,
key_value => kypd_values,
key_valid => kypd_valid);


pcam_rst <= '1';
pcam_pwdn <= '0';

led(1) <= pixel_valid;
led(2) <= frame_done;
led(4) <= joy_x(9);
led(5) <= joy_y(9);
led(6) <= kypd_valid;
led(7) <= kypd_values(3);
end Behavioral;
