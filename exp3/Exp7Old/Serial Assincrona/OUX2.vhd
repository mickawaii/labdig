library ieee;
use ieee.std_logic_1164.all;

entity OUX2 is
	port(x,y: in std_logic;
			z: out std_logic);
end OUX2;

architecture yay of OUX2 is
	begin
		z <= x xor y;
end yay;