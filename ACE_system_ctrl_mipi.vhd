library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ACE_system_ctrl is
Port (
 clk: in std_logic;
 rst_n: in std_logic;
 -- MIPI/Camera control only (video handled by Xilinx CSI-2 IP)
 cam_sda: inout std_logic;
 cam_scl: out std_logic;
 cam_reset: out std_logic;
 cam_pwdn: out std_logic;
 cam_init_done : in std_logic;
 video_locked : in std_logic;
 -- joystick
 js_miso: in std_logic;
 js_mosi: out std_logic;
 js_sclk: out std_logic;
 js_cs: out std_logic;
 -- keypad
 kypd_rows: in std_logic_vector(3 downto 0);
 kypd_cols: out std_logic_vector(3 downto 0);
 led: out std_logic_vector(7 downto 0)
);
end;

architecture rtl of ACE_system_ctrl is
signal joy_x, joy_y : std_logic_vector(9 downto 0);
signal key_value : std_logic_vector(3 downto 0);
signal key_valid : std_logic;
signal exposure,gain : unsigned(7 downto 0):=x"40";
signal stream_enable : std_logic := '1';
begin
joystick_inst: entity work.jstk_ctrl port map(
 clk=>clk,rst_n=>rst_n,miso=>js_miso,mosi=>js_mosi,
 sclk=>js_sclk,cs=>js_cs,joy_x=>joy_x,joy_y=>joy_y);

keypad_inst: entity work.kypd_ctrl port map(
 clk=>clk,rst_n=>rst_n,row_in=>kypd_rows,col_out=>kypd_cols,
 key_value=>key_value,key_valid=>key_valid);

process(clk)
begin
 if rising_edge(clk) then
   if rst_n='0' then
      exposure<=x"40"; gain<=x"40"; stream_enable<='1';
   else
      if unsigned(joy_y) > 700 then exposure <= exposure + 1;
      elsif unsigned(joy_y) < 300 then exposure <= exposure - 1; end if;
      if unsigned(joy_x) > 700 then gain <= gain + 1;
      elsif unsigned(joy_x) < 300 then gain <= gain - 1; end if;
      if key_valid='1' then
         case key_value is
           when "0001" => null; -- 720p
           when "0010" => null; -- 1080p
           when "1101" => stream_enable <= not stream_enable; -- D
           when others => null;
         end case;
      end if;
   end if;
 end if;
end process;

cam_reset <= rst_n;
cam_pwdn <= '0';
led(0)<=cam_init_done;
led(1)<=video_locked;
led(2)<=stream_enable;
led(4)<=joy_x(9);
led(5)<=joy_y(9);
led(6)<=key_valid;
led(7)<=key_value(0);
led(3)<='1';
end rtl;
