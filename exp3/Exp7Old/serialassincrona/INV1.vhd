library ieee;
use ieee.std_logic_1164.all;

entity INV1 is
	port(x: in std_logic;
			y: out std_logic);
end INV1;

architecture yay of INV1 is
begin
	y <= not x;
end yay;