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

end Behavioral;