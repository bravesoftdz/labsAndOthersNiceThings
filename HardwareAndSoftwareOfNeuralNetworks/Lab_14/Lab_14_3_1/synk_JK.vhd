library ieee;
use ieee.std_logic_1164.all;
entity synk_JK is
	PORT (J: in std_logic;
		K: in std_logic;
		CLK: in std_logic;
		PRST: in std_logic;
		CLR: in std_logic;
		Q: out std_logic;
		QB: out std_logic);
end synk_JK;
Architecture Arch_synk_JK of synk_JK is
begin
	JK: process (CLK, CLR, PRST)
	variable x: std_logic;
	begin
		if (CLR='0') then
			x:='0';
		elsif (PRST='0') then
			x:='1';
		elsif (CLK='1' and CLK'EVENT) then
			if (J='0' and K='0') then
				x:=x;
			elsif (J='1' and K='1') then
				x:= not x;
			elsif (J='0' and K='1') then
				x:='0';
			else
				x:='1';
			end if;
		end if;
		Q <= x;
		QB <= not x;
	end process JK;
end Arch_synk_JK;