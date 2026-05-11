
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity camera_reg_writer is
port(
 clk,rst : in std_logic;
 wr_req : in std_logic;
 reg_addr : in std_logic_vector(15 downto 0);
 reg_data : in std_logic_vector(7 downto 0);
 busy : out std_logic;
 i2c_start : out std_logic;
 i2c_addr : out std_logic_vector(15 downto 0);
 i2c_data : out std_logic_vector(7 downto 0)
);
end;

architecture rtl of camera_reg_writer is
type state_t is (IDLE, ISSUE, WAIT_ACK);
signal state : state_t := IDLE;
begin
process(clk)
begin
 if rising_edge(clk) then
   if rst='1' then
      state <= IDLE;
      i2c_start <= '0';
      busy <= '0';
   else
      case state is
        when IDLE =>
          busy <= '0';
          i2c_start <= '0';
          if wr_req='1' then
            i2c_addr <= reg_addr;
            i2c_data <= reg_data;
            state <= ISSUE;
          end if;
        when ISSUE =>
          busy <= '1';
          i2c_start <= '1';
          state <= WAIT_ACK;
        when WAIT_ACK =>
          i2c_start <= '0';
          state <= IDLE;
      end case;
   end if;
 end if;
end process;
end rtl;
