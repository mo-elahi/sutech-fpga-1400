library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package alarmPackage is
  component alarm_clock is
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
  end component alarm_clock;
end package alarmPackage;
 
-- Package Body Section
package body alarmPackage is 
end package body alarmPackage;
