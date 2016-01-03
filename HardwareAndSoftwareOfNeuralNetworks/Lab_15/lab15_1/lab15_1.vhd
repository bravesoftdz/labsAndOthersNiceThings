library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity lab_15_1 is
generic ( r: integer :=4;
	b: integer :=4 );
	port ( p1,p2,p3,p4: in signed (b-1 downto 0);
	w: in signed (b-1 downto 0);
	clk: in STD_LOGIC;
	a: out signed (2*b-1 downto 0) );
end lab_15_1;

architecture Arch_neuron_one of lab_15_1 is
type weights is array (1 to r) of signed (b-1 downto 0);
type inputs is array (1 to r) of signed (b-1 downto 0);
begin
	process (clk, w, p1, p2, p3,p4)
	variable weight: weights; variable input: inputs;
	variable prod, acc: signed (2*b-1 downto 0);
	begin
		if (clk'event and clk='1') then
			weight :=w & weight (1 to r-1);
		end if;
		input(1) :=p1; input(2) :=p2; input(3) :=p3; input(4) := p4;
		acc := (others => '0');
		l1: for j in 1 to r loop
			prod := input(j)*weight(j); acc := acc + prod;
		end loop l1;
		a <= acc;
	end process;
end Arch_neuron_one;