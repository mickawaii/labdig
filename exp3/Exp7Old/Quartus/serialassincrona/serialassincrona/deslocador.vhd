library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity deslocador is
	port (	clk, clr: in std_logic;
			paridade: in std_logic;
			dataIn: in std_logic_vector (2 downto 0);
			dataOut: out std_logic
			);
end deslocador;

architecture shiftreg of deslocador is
signal qs: std_logic_vector (3 downto 0);
signal cont: unsigned(4 downto 0);

begin
	process (clk, clr)
	begin
		cont <= (others => '0');
		if clr = '1' then
			qs <= "0000";
		elsif clk'event and clk = '1' and cont = 0 then
			qs(2 downto 0) <= dataIn;
			qs(0) <= paridade;
			dataOut <= qs(3);
			qs(3 downto 1) <= qs(2 downto 0);
			qs(0) <= '0';
		elsif clk'event and clk = '1' then
			dataOut <= qs(3);
			qs(3 downto 1) <= qs(2 downto 0);
			qs(0) <= '0';
		end if;
		cont <= cont + 1;
	end process;
end shiftreg;