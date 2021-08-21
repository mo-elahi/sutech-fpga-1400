library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity clk_div is
					port (
								clk_50: in std_logic;
								clk_1s: out std_logic
							);
end clk_div;

architecture Behavioral of clk_div is

signal counter: std_logic_vector(27 downto 0):=(others =>'0');
begin
 process(clk_50)
	begin
			if(rising_edge(clk_50)) then
					counter <= counter + x"0000001";
					if(counter>=x"4E20") then --50000000 shomaresh shodeh 1 saneyeh 
						counter <= x"0000000";
					end if;
			end if;
 end process;
 
 clk_1s <= '1' when counter < x"2710" else '0';-- 25000000 shomaresh shodeh nesf d; saneyeh
 
end Behavioral;