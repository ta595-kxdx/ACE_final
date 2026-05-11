
library ieee;
use ieee.std_logic_1164.all;

entity keypad_command_decoder is
port(
 clk : in std_logic;
 key_valid : in std_logic;
 key_value : in std_logic_vector(3 downto 0);
 mode_720p, mode_1080p, grayscale, edge_detect,
 brightness_up, brightness_down,
 snapshot, test_pattern, reset_camera,
 awb_enable, manual_exposure,
 stream_enable : out std_logic
);
end;

architecture rtl of keypad_command_decoder is
begin
process(clk)
begin
 if rising_edge(clk) then
   mode_720p<='0'; mode_1080p<='0';
   grayscale<='0'; edge_detect<='0';
   brightness_up<='0'; brightness_down<='0';
   snapshot<='0'; test_pattern<='0';
   reset_camera<='0'; awb_enable<='0';
   manual_exposure<='0'; stream_enable<='0';
   if key_valid='1' then
      case key_value is
       when "0001" => mode_720p<='1';
       when "0010" => mode_1080p<='1';
       when "0011" => grayscale<='1';
       when "0100" => edge_detect<='1';
       when "0101" => brightness_up<='1';
       when "0110" => brightness_down<='1';
       when "0111" => snapshot<='1';
       when "1000" => test_pattern<='1';
       when "1001" => reset_camera<='1';
       when "1010" => awb_enable<='1';
       when "1011" => manual_exposure<='1';
       when "1101" => stream_enable<='1';
       when others => null;
      end case;
   end if;
 end if;
end process;
end rtl;
