library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity camera_ctrl_fsm is
port(clk:in std_logic; rst:in std_logic; joy_up,joy_down,joy_left,joy_right,key_valid:in std_logic;
 reg_addr:out std_logic_vector(15 downto 0); reg_data:out std_logic_vector(7 downto 0); wr_en:out std_logic);
end;
architecture rtl of camera_ctrl_fsm is begin
process(clk) begin if rising_edge(clk) then wr_en<='0';
 if joy_up='1' then reg_addr<=x"3500"; reg_data<=x"50"; wr_en<='1'; end if;
 end if; end process; end;
