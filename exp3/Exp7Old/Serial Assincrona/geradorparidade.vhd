library ieee;
use ieee.std_logic_1164.all;

entity geradorparidade is
	port(b0,b1,b2,b3,b4,b5,b6 : in std_logic;
			b7: out std_logic);
end geradorparidade;

architecture yay of geradorparidade is

component OUX2 is
	port(x,y: in std_logic;
			z: out std_logic);
end component;

component INV1 is
	port(x: in std_logic;
			y: out std_logic);
end component;

signal n0,n1,n2,n3,n4,n5: std_logic;

begin
	X1: OUX2 port map (b0,b1,n0);
	X2:	OUX2 port map (b2,b3,n1);
	X3:	OUX2 port map (b4,b5,n2);
	X4:	OUX2 port map (n0,n1,n3);
	X5:	OUX2 port map (n2,b6,n4);
	X6:	OUX2 port map (n3,n4,n5);
	I1:	INV1 port map (n5,b7);
end yay;