library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity T_FF is
   port( T: in  std_logic;
         Reset: in std_logic;
         Clock_enable: in std_logic;
         Clock: in std_logic;
         Output: out std_logic);
end T_FF;
 
architecture Behavioral of T_FF is
   signal temp: std_logic;
begin
   process (Clock) 
   begin
      if (Clock'event and Clock='0') then 		
         if Reset='1' then   
            temp <= '0' after 6ns;
         elsif Clock_enable ='1' then
			if T='0' then
			   temp <= temp after 10ns;
			elsif T='1' then
			   temp <= not (temp) after 10ns;
			end if;
         end if;
      end if;
   end process;
   Output <= temp;
end Behavioral;