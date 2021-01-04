----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2021 11:15:37
-- Design Name: 
-- Module Name: Block_memory - Behavioral
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
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity distributed_memory is 
Port (
clk : in std_logic; 
wr  : in std_logic;
addr : in std_logic_vector(9 downto 0);
data_in : in std_logic_vector(7 downto 0);
data_out: out std_logic_vector(7 downto 0)
 );
end distributed_memory;

architecture Behavioral of distributed_memory is
type mem_type is array(1023 downto 0) of std_logic_vector(7 downto 0);
signal mem : mem_type;
begin
process(clk)
begin
if(rising_edge(clk)) then
   if(wr = '1') then
   mem(to_integer(unsigned(addr)))<= data_in; 
   end if;
end if;
   data_out <= mem(to_integer(unsigned(addr)));
end process;

end Behavioral;
