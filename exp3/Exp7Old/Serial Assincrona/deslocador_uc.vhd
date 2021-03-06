library ieee;
use ieee.std_logic_1164.all;

entity deslocador_uc is
	port(iniciar,fim,clock: in std_logic;
			send,load: out std_logic);
end deslocador_uc;

architecture yay of deslocador_uc is
type state_type is (init,a,esp);
signal snext, sreg: state_type;
begin
	process(clock)
	begin
		if clock'event and clock='1' then
			sreg<=snext;
		end if;
	end process;
	
	process(iniciar,fim,sreg)
	begin
		case sreg is
			when init   => if iniciar='1' then snext<=init;
						   else snext<=a;
						   end if;
			
			when a      => if fim='0' then snext<=a;
						   else snext<=esp;
						   end if;
			
			when esp    => if iniciar='0' then snext<=esp;
						   else snext<=init;
						   end if;
		end case;
	end process;
	
	
	with sreg select
		send <= '0' when init | esp, '1' when a;

	with sreg select
		load <= '1' when init, '0' when a | esp;
		

end yay;