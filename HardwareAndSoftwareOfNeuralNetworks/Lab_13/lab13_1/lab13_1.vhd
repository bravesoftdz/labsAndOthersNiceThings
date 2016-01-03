library ieee;
 use ieee.std_logic_1164.all;
 
entity RS_FF is
 PORT ( S:       in   std_logic;
        R:       in   std_logic;
        CLOCK:   in   std_logic;
        CLR:     in   std_logic;
        PRESET:  in   std_logic;
        Q:      out   std_logic;
        QN:     out   std_logic);
     end RS_FF;
     
     Architecture Arch_RS_FF of RS_FF is
     begin
      FF:process(CLOCK,CLR,PRESET)
begin
  if (CLR='0') then
     x:='0';
  elsif(PRESET='0') then
     x:='1';
  elsif(CLOCK='1' and CLOCK'EVENT) then
	if (S='0' and R='0') then
		x:=x;
    elsif(S='1' and R='1') then
        x:='Z';
    elsif(S='0' and R='1') then 
        x:='0';
    else
        x:='1';
    end if;
  end if;
  Q<=x;
  QN<=not x;
  end process FF;
end Arch_RS_FF;
      