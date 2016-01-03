library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PZP_CONST is
port(clk : in  std_logic;
	cs : in  std_logic;
	rd : in  std_logic;
	address : in  std_logic_vector(3 downto 0);
	data_out: out std_logic_vector(7 downto 0));
end PZP_CONST;

architecture behav of PZP_CONST is
type PZP_CONST_array is array(0 to 31)
of std_logic_vector(7 downto 0);
constant content: PZP_CONST_array := (
  0=> "00000000",
  1=> "00000001",
  2=> "00000010",
  3=> "00000100",
  4=> "00000101",
  5=> "00000110",
  6=> "00000110",
  7=> "00000111",
  8=> "00001000",
  9=> "00001001",
  10=> "00001010",
  11=> "00001011",
  12=> "00001100", 
  13=> "00001101",
  14=> "00001110",
  15=> "00001111",
  others=> "11111111"); 
begin
process(clk, cs)
	begin
		if(cs = '1') then
			data_out <= "ZZZZZZZZ";
		elsif(clk'event and clk = '1') then
			if rd = '1' then
				data_out <= content(to_integer (unsigned(address)));
			else
				data_out <= "ZZZZZZZZ";
			end if;
		end if;
end process;
end behav;