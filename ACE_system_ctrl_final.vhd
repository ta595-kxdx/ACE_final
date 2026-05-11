
library ieee;
use ieee.std_logic_1164.all;

entity ACE_system_ctrl_final is
port(
 clk : in std_logic;
 rst_n : in std_logic;
 joy_up, joy_down, joy_left, joy_right : in std_logic;
 key_valid : in std_logic;
 key_value : in std_logic_vector(3 downto 0);
 reg_addr : out std_logic_vector(15 downto 0);
 reg_data : out std_logic_vector(7 downto 0);
 wr_req : out std_logic
);
end;

architecture rtl of ACE_system_ctrl_final is
begin
fsm : entity work.camera_ctrl_fsm
port map(
 clk=>clk,
 rst=>not rst_n,
 joy_up=>joy_up,
 joy_down=>joy_down,
 joy_left=>joy_left,
 joy_right=>joy_right,
 key_valid=>key_valid,
 reg_addr=>reg_addr,
 reg_data=>reg_data,
 wr_en=>wr_req
);
end rtl;
