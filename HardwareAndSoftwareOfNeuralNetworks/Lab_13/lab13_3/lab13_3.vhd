library ieee;
 use ieee.std_logic_1164.all;
 
entity JK_FF is
 PORT ( K:       in   std_logic;
        J:       in   std_logic;
        CLK:     in   std_logic;
        CLR:     in   std_logic;
        PRE:     in   std_logic;
        QN:       out   std_logic;
        Q:       out   std_logic);
        
     end JK_FF;
     
     Architecture Arch_JK_FF of JK_FF is

     begin
      FF:process(CLK,PRE,CLR)
                variable x:std_logic;
begin
  if (CLR='0') then
    x:='0';
   else
     if (PRE='0') then
    x:='1';  
   else
       if (CLK='1') and CLK'EVENT then
    if (J='0' and K='0') then
        x:= x;
        elsif (J='1' and K='1') then
        x:= not x;
        elsif (J='0' and K='1') then
        x:= '0';
        else
        x:='1';
        
        
            end if;         
        end if;
         end if;
       end if;
       Q<=x;
       QN<= not x;
            
                end process FF;
                end Arch_JK_FF;