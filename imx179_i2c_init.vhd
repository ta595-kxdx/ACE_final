
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity imx179_i2c_init is
port(
 clk,rst,start : in std_logic;
 reg_addr : out std_logic_vector(15 downto 0);
 reg_data : out std_logic_vector(7 downto 0);
 wr_req : out std_logic;
 done : out std_logic
);
end;

architecture rtl of imx179_i2c_init is
type rom_t is array(0 to 5) of std_logic_vector(23 downto 0);
constant INIT_ROM : rom_t := (
 x"010000", -- standby
 x"030101",
 x"034000",
 x"034101",
 x"010001", -- stream on
 x"FFFF00"
);
signal idx : integer := 0;
begin
process(clk)
begin
 if rising_edge(clk) then
   if rst='1' then
      idx <= 0; done<='0'; wr_req<='0';
   elsif start='1' then
      if INIT_ROM(idx)(23 downto 8) /= x"FFFF" then
         reg_addr <= INIT_ROM(idx)(23 downto 8);
         reg_data <= INIT_ROM(idx)(7 downto 0);
         wr_req <= '1';
         idx <= idx + 1;
      else
         done <= '1';
         wr_req <= '0';
      end if;
   end if;
 end if;
end process;
end rtl;
