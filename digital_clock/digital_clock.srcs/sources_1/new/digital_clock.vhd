library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity digital_clock is
		port ( 
					clk: in std_logic; -- clock 50 MHz
					
					clock_on: in std_logic;
					
					set_time: in std_logic;
					
					set_alarm: in std_logic;
					
					stop_alarm: in std_logic;
					
					alarm_on: in std_logic;
												
					rst_n: in std_logic; -- ba sefr kardan reset saneyeh sefr meshavad va daghegheh va saat vorodi tanzim meshavan 

					H_in1: in std_logic_vector(1 downto 0);-- tanzim saat ke in dahgan saat hast ya 0 ya 1 ya 2

					H_in0: in std_logic_vector(3 downto 0); -- tanzim yekan saat ke az 0 ta 9 metavanad bashad
					
					M_in1: in std_logic_vector(3 downto 0);--tanzim dahgan daghegheh 

					M_in0: in std_logic_vector(3 downto 0);--tanzim yekan daghegheh
					
					alarm: out std_logic;

					H_out1: out std_logic_vector(6 downto 0);--dahgan moadel saat royeh in payeh gharar megerad ke royeh seven seg gharar gerad
					
					H_out0: out std_logic_vector(6 downto 0);--yekan moadel saat royeh in payeh gharar megerad ke royeh seven seg gharar gerad
					
					M_out1: out std_logic_vector(6 downto 0);--dahgan moadel daghegheh royeh in payeh gharar megerad ke royeh seven seg gharar gerad
					
					M_out0: out std_logic_vector(6 downto 0);--yekan moadel daghegheh royeh in payeh gharar megerad ke royeh seven seg gharar gerad
					
					S_out1: out std_logic_vector(6 downto 0);--dahgan moadel saneyeh royeh in payeh gharar megerad ke royeh seven seg gharar gerad
					
					S_out0: out std_logic_vector(6 downto 0)--yekan moadel saneyeh royeh in payeh gharar megerad ke royeh seven seg gharar gerad
					
						);
					end digital_clock;

architecture Behavioral of digital_clock is

component bin2hex
				port (
							Bin: in std_logic_vector(3 downto 0);
							Hout: out std_logic_vector(6 downto 0)
						);
end component;

component clk_div
				port (
							clk_50: in std_logic;
							clk_1s: out std_logic
						);
end component;

signal clk_1s: std_logic; -- signal clock ba doreh yek saneyeh
signal counter_hour , counter_minute, counter_second , alarm_min , alarm_hour  : integer;
signal  flag : integer range 0 to 1;

-- counter using for create time
signal H_out1_bin: std_logic_vector(3 downto 0); --dahgan saat
signal H_out0_bin: std_logic_vector(3 downto 0);--yekan saat
signal M_out1_bin: std_logic_vector(3 downto 0);--dahgan  daghegheh
signal M_out0_bin: std_logic_vector(3 downto 0);--yekan daghegheh
signal S_out1_bin: std_logic_vector(3 downto 0);--dahgan saneyeh
signal S_out0_bin: std_logic_vector(3 downto 0);--yakan saneyeh

begin

create_1s_clock: clk_div port map (clk_50 => clk, clk_1s => clk_1s); --sakht 1s

process(clk_1s,rst_n,clock_on,set_alarm,set_time) 

variable  counter_buzzer: integer range 0 to 9;

begin 

	
		
	if(clock_on = '1') then
	
		if(set_alarm='1')then
		
		   counter_buzzer:=0;
			alarm_hour <= to_integer(unsigned(H_in1))*10 + to_integer(unsigned(H_in0));
			alarm_min  <= to_integer(unsigned(M_in1))*10 + to_integer(unsigned(M_in0));
		
		end if;
	
		if(rst_n = '1') then
			counter_hour <= 0;
			counter_minute <= 0;
			counter_second <= 0;
			
		elsif(set_time='1') then
		
		   counter_hour   <= to_integer(unsigned(H_in1))*10 + to_integer(unsigned(H_in0));
			counter_minute <= to_integer(unsigned(M_in1))*10 + to_integer(unsigned(M_in0));
			counter_second <= 0;
		
		elsif(rising_edge(clk_1s)) then
			counter_second <= counter_second + 1;
			counter_buzzer := counter_buzzer + 1;
			
				
			if(counter_second >=59) then -- agar (saneyeh > 59) shavad daghegheh afzayesh meyabad
					counter_minute <= counter_minute + 1;
					flag<=0;
					counter_second <= 0;
					
					if(counter_minute >=59) then  -- agar (daghegheh > 59) shavad daghegheh afzayesh meyabad
						counter_minute <= 0;
						counter_hour <= counter_hour + 1;
						
						if(counter_hour >= 24) then -- agar (saat > 24) shavad saat sefr meshavad
							counter_hour <= 0;
							
						end if;
						
					end if;
					
			end if;
			
			if( (counter_minute=alarm_min) and (counter_hour=alarm_hour) and alarm_on='1' and flag=0) then
				
				counter_buzzer:=0;
			
				flag<=1;
				
				alarm<='1';
			
			end if;
			
			if(  (stop_alarm='1') or (counter_buzzer>=9) or (alarm_on='0')  )then
				
				alarm<='0';
				
			end if;
			
		end if;
	end if;
		
end process;


-- dahgan saat barayeh namayesh
 H_out1_bin <= x"2" when counter_hour >=20 else
					x"1" when counter_hour >=10 else
					x"0";
convert_hex_H_out1: bin2hex port map (Bin => H_out1_bin, Hout => H_out1); -- namayesh moadel dahgan saat royeh 7seg



H_out0_bin <= std_logic_vector(to_unsigned((counter_hour - to_integer(unsigned(H_out1_bin))*10),4));-- yekan saat barayeh namayesh
convert_hex_H_out0: bin2hex port map (Bin => H_out0_bin, Hout => H_out0); -- namayesh moadel yekan saat royeh 7seg


-- dahgan daghegheh barayeh namayesh
 M_out1_bin <= x"5" when counter_minute >=50 else
					x"4" when counter_minute >=40 else
					x"3" when counter_minute >=30 else
					x"2" when counter_minute >=20 else
					x"1" when counter_minute >=10 else
					x"0";
convert_hex_M_out1: bin2hex port map (Bin => M_out1_bin, Hout => M_out1); -- namayesh moadel dahgan daghegheh royeh 7seg


M_out0_bin <= std_logic_vector(to_unsigned((counter_minute - to_integer(unsigned(M_out1_bin))*10),4));-- yekan daghegheh barayeh namayesh
convert_hex_M_out0: bin2hex port map (Bin => M_out0_bin, Hout => M_out0); -- namayesh moadel yekan daghegheh royeh 7seg

-- dahgan daghegheh barayeh namayesh
S_out1_bin <=  x"5" when counter_second >=50 else
					x"4" when counter_second >=40 else
					x"3" when counter_second >=30 else
					x"2" when counter_second >=20 else
					x"1" when counter_second >=10 else
					x"0";
convert_hex_S_out1: bin2hex port map (Bin => S_out1_bin, Hout => S_out1); -- namayesh moadel dahgan daghegheh royeh 7seg


S_out0_bin <= std_logic_vector(to_unsigned((counter_second - to_integer(unsigned(S_out1_bin))*10),4));-- yekan daghegheh barayeh namayesh
convert_hex_S_out0: bin2hex port map (Bin => S_out0_bin, Hout => S_out0); -- namayesh moadel yekan daghegheh royeh 7seg


end Behavioral;