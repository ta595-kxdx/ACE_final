library ieee;
use ieee.std_logic_1164.all;

entity Pcam_top_final is
port(
    clk : in std_logic;
    rst : in std_logic;
    dphy_hs_clock_clk_p : in std_logic;
    dphy_hs_clock_clk_n : in std_logic;
    dphy_data_hs_p : in std_logic_vector(1 downto 0);
    dphy_data_hs_n : in std_logic_vector(1 downto 0);
    dphy_clk_lp_p : in std_logic;
    dphy_clk_lp_n : in std_logic;
    dphy_data_lp_p : in std_logic_vector(1 downto 0);
    dphy_data_lp_n : in std_logic_vector(1 downto 0);
    cam_scl : out std_logic;
    cam_sda : inout std_logic;
    cam_clk : out std_logic;
    cam_gpio : out std_logic;
    js_miso : in std_logic;
    js_mosi : out std_logic;
    js_sclk : out std_logic;
    js_cs   : out std_logic;
    kypd_rows : in std_logic_vector(3 downto 0);
    kypd_cols : out std_logic_vector(3 downto 0);
    led : out std_logic_vector(7 downto 0)
);
end entity;

architecture rtl of Pcam_top_final is
begin
ctrl_inst : entity work.ACE_system_ctrl
port map(
    clk => clk,
    rst_n => not rst,
    pcam_sda => cam_sda,
    pcam_scl => cam_scl,
    pcam_xclk => cam_clk,
    pcam_rst => cam_gpio,
    pcam_pwdn => open,
    js_miso => js_miso,
    js_mosi => js_mosi,
    js_sclk => js_sclk,
    js_cs => js_cs,
    kypd_rows => kypd_rows,
    kypd_cols => kypd_cols,
    led => led
);
end rtl;
