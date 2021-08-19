LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_alarm_clock IS
END tb_alarm_clock;
 
ARCHITECTURE behavior OF tb_alarm_clock IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alarm_clock
    PORT(
         clk : IN  std_logic;
         clock_on : IN  std_logic;
         set_time : IN  std_logic;
         set_alarm : IN  std_logic;
         stop_alarm : IN  std_logic;
         alarm_on : IN  std_logic;
         rst_n : IN  std_logic;
         H_in1 : IN  std_logic_vector(1 downto 0);
         H_in0 : IN  std_logic_vector(3 downto 0);
         M_in1 : IN  std_logic_vector(3 downto 0);
         M_in0 : IN  std_logic_vector(3 downto 0);
         alarm : OUT  std_logic;
         H_out1 : OUT  std_logic_vector(6 downto 0);
         H_out0 : OUT  std_logic_vector(6 downto 0);
         M_out1 : OUT  std_logic_vector(6 downto 0);
         M_out0 : OUT  std_logic_vector(6 downto 0);
         S_out1 : OUT  std_logic_vector(6 downto 0);
         S_out0 : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clock_on : std_logic := '0';
   signal set_time : std_logic := '0';
   signal set_alarm : std_logic := '0';
   signal stop_alarm : std_logic := '0';
   signal alarm_on : std_logic := '0';
   signal rst_n : std_logic := '0';
   signal H_in1 : std_logic_vector(1 downto 0) := (others => '0');
   signal H_in0 : std_logic_vector(3 downto 0) := (others => '0');
   signal M_in1 : std_logic_vector(3 downto 0) := (others => '0');
   signal M_in0 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal alarm : std_logic;
   signal H_out1 : std_logic_vector(6 downto 0);
   signal H_out0 : std_logic_vector(6 downto 0);
   signal M_out1 : std_logic_vector(6 downto 0);
   signal M_out0 : std_logic_vector(6 downto 0);
   signal S_out1 : std_logic_vector(6 downto 0);
   signal S_out0 : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alarm_clock PORT MAP (
          clk => clk,
          clock_on => clock_on,
          set_time => set_time,
          set_alarm => set_alarm,
          stop_alarm => stop_alarm,
          alarm_on => alarm_on,
          rst_n => rst_n,
          H_in1 => H_in1,
          H_in0 => H_in0,
          M_in1 => M_in1,
          M_in0 => M_in0,
          alarm => alarm,
          H_out1 => H_out1,
          H_out0 => H_out0,
          M_out1 => M_out1,
          M_out0 => M_out0,
          S_out1 => S_out1,
          S_out0 => S_out0
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin	
	
--       clock_on<='1';
--		 set_alarm<='0';
--		 set_time <= '1';
--		 H_in1 <= "01";
--       H_in0 <= x"0";
--       M_in1 <= x"2";
--       M_in0 <= x"0";
--       wait for 100 ns; 
--		 set_time <= '0';
--		 set_alarm<='1';
--		 H_in1 <= "01";
--       H_in0 <= x"0";
--       M_in1 <= x"2";
--       M_in0 <= x"1";
--		 wait for 100 ns; 
--		 set_time <= '0';
--		 set_alarm<='0';
--		 alarm_on<='1';
--		 wait for 1000 ns;
--		 rst_n<='1';
--		 wait;
		 
		 clock_on<='1';
		 set_alarm<='0';
		 set_time <= '1';
		 H_in1 <= "01";
       H_in0 <= x"0";
       M_in1 <= x"2";
       M_in0 <= x"0";
       wait for 100 ns; 
		 set_time <= '0';
		 wait for 10000 ms;
		 
		 set_time <= '1';
		 H_in1 <= "01";
       H_in0 <= x"0";
       M_in1 <= x"2";
       M_in0 <= x"9";
       wait for 100 ns; 
		 set_time <= '0';
		 wait for 10000 ms;
		 
		 set_time <= '1';
		 H_in1 <= "01";
       H_in0 <= x"2";
       M_in1 <= x"5";
       M_in0 <= x"9";
       wait for 100 ns; 
		 set_time <= '0';
		 wait for 10000 ms;
		 
		 set_time <= '1';
		 H_in1 <= "00";
       H_in0 <= x"2";
       M_in1 <= x"4";
       M_in0 <= x"4";
       wait for 100 ns; 
		 set_time <= '0';
		 wait for 10000 ms;
		 
		 set_time <= '1';
		 H_in1 <= "10";
       H_in0 <= x"1";
       M_in1 <= x"3";
       M_in0 <= x"0";
       wait for 100 ns; 
		 set_time <= '0';
		 wait for 10000 ms;
		 
		 set_time <= '1';
		 H_in1 <= "00";
       H_in0 <= x"5";
       M_in1 <= x"4";
       M_in0 <= x"4";
       wait for 100 ns; 
       set_time <= '0';
		 set_alarm<='1';
		 H_in1 <= "00";
       H_in0 <= x"5";
       M_in1 <= x"4";
       M_in0 <= x"5";
		 wait for 100 ns; 
		 set_time <= '0';
		 set_alarm<='0';
		 alarm_on<='1';
		 wait for 70000 ms;
		 
		 set_time <= '1';
		 H_in1 <= "10";
       H_in0 <= x"2";
       M_in1 <= x"3";
       M_in0 <= x"3";
       wait for 100 ns; 
       set_time <= '0';
		 set_alarm<='1';
		 H_in1 <= "10";
       H_in0 <= x"2";
       M_in1 <= x"3";
       M_in0 <= x"4";
		 wait for 100 ns; 
		 set_time <= '0';
		 set_alarm<='0';
		 alarm_on<='1';
		 wait for 70000 ms;
		 
		 set_time <= '1';
		 H_in1 <= "00";
       H_in0 <= x"2";
       M_in1 <= x"4";
       M_in0 <= x"3";
       wait for 100 ns; 
       set_time <= '0';
		 set_alarm<='1';
		 H_in1 <= "00";
       H_in0 <= x"2";
       M_in1 <= x"4";
       M_in0 <= x"4";
		 wait for 100 ns; 
		 set_time <= '0';
		 set_alarm<='0';
		 alarm_on<='1';
		 wait for 70000 ms;
		 wait;
		 

      -- insert stimulus here 

      wait;
   end process;

END;
