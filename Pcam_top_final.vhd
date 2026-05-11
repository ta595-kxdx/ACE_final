
library ieee;
use ieee.std_logic_1164.all;

entity Pcam_top_final is
port(
 clk : in std_logic;
 rst : in std_logic;

 -- MIPI CSI-2 dedicated port
 mipi_clk_p : in std_logic;
 mipi_clk_n : in std_logic;
 mipi_d0_p  : in std_logic;
 mipi_d0_n  : in std_logic;
 mipi_d1_p  : in std_logic;
 mipi_d1_n  : in std_logic;

 -- camera ctrl
 cam_scl    : out std_logic;
 cam_sda    : inout std_logic;
 cam_reset  : out std_logic;
 cam_pwdn   : out std_logic;

 -- joystick
 js_miso    : in std_logic;
 js_mosi    : out std_logic;
 js_sclk    : out std_logic;
 js_cs      : out std_logic;

 -- keypad
 kypd_rows  : in std_logic_vector(3 downto 0);
 kypd_cols  : out std_logic_vector(3 downto 0);

 led         : out std_logic_vector(7 downto 0)
);
end entity;

architecture rtl of Pcam_top_final is
signal init_done, wr_req, wr_busy : std_logic;
signal reg_addr : std_logic_vector(15 downto 0);
signal reg_data : std_logic_vector(7 downto 0);
signal i2c_start : std_logic;
begin

cam_init : entity work.imx179_i2c_init
port map(
 clk=>clk,
 rst=>rst,
 start=>'1',
 reg_addr=>reg_addr,
 reg_data=>reg_data,
 wr_req=>wr_req,
 done=>init_done
);

reg_write : entity work.camera_reg_writer
port map(
 clk=>clk,
 rst=>rst,
 wr_req=>wr_req,
 reg_addr=>reg_addr,
 reg_data=>reg_data,
 busy=>wr_busy,
 i2c_start=>i2c_start,
 i2c_addr=>open,
 i2c_data=>open
);

ctrl : entity work.ACE_system_ctrl
port map(
 clk=>clk,
 rst_n=>not rst,
 cam_sda=>cam_sda,
 cam_scl=>cam_scl,
 cam_reset=>cam_reset,
 cam_pwdn=>cam_pwdn,
 cam_init_done=>init_done,
 video_locked=>'1',
 js_miso=>js_miso,
 js_mosi=>js_mosi,
 js_sclk=>js_sclk,
 js_cs=>js_cs,
 kypd_rows=>kypd_rows,
 kypd_cols=>kypd_cols,
 led=>led
);

-- MIPI handled in Vivado BD:
-- DPHY RX -> CSI2 RX -> AXI4 Stream
-- expose AXI stream to framebuffer later

end rtl;
