LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY divfreq_gen IS
	GENERIC (fator : NATURAL:=2);
	PORT(	SIGNAL clock    : IN STD_LOGIC;
			SIGNAL q        : OUT STD_LOGIC);
END divfreq_gen;

ARCHITECTURE arch_d OF divfreq_gen IS

	SIGNAL q_tmp : STD_LOGIC;

BEGIN

	PROCESS(clock)
		VARIABLE contagem: NATURAL RANGE 0 TO fator-1;
	BEGIN
		IF Rising_Edge(clock) THEN
			IF contagem = fator/2-1 THEN
				q_tmp <= NOT(q_tmp);
				contagem := contagem+1;
			ELSIF contagem = fator-1 THEN
				q_tmp <= NOT(q_tmp);
				contagem := 0;
			ELSE
				contagem := contagem+1;
			END IF;
		END IF;
	END PROCESS; 

	q <= q_tmp;

END arch_d;