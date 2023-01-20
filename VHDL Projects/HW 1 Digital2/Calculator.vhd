LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--USE ieee.numeric_std.ALL;
 
ENTITY Calculator IS
END Calculator;
 
ARCHITECTURE behavior OF Calculator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 COMPONENT Fibonacci_Calculator
    Port (  clk : in std_logic;
           data_in : in std_logic_vector (3 downto 0);
            load_enable : in std_logic;
           data_out : out std_logic_vector (9 downto 0));
           
  END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal load_enable : std_logic := '0';
   signal data_in : std_logic_vector(3 downto 0);

 	--Outputs
   signal data_out : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 0.5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   n1: Fibonacci_Calculator PORT MAP (
          clk => clk,
          load_enable => load_enable,
          data_in => data_in,
          data_out => data_out
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
      -- load_enable off
      -- n=0
      load_enable <= '0';
       data_in <="0000";
        wait for clk_period;
        -- load_enable on
       load_enable <= '1';
      
 
		-- n=1
        wait for clk_period*1;
       
		 data_in <="0001";
      
      
      -- n=2
       wait for clk_period*1;
        
        data_in <="0010";
    
        
       
       -- n=3
       wait for clk_period*1;
        
        data_in <="0011";
        
        
        -- n=4
       wait for clk_period*1;
        
        data_in <="0100";
        
        
          -- n=5
       wait for clk_period*1;
        
        data_in <="0101";
        
        
          -- n=6
       wait for clk_period*1;
        
        data_in <="0110";
        
        
          -- n=7
       wait for clk_period*1;
        
        data_in <="0111";
        
        
          -- n=8
       wait for clk_period*1;
        
        data_in <="1000";
        
        
          -- n=9
       wait for clk_period*1;
        
        data_in <="1001";
        
          -- n=10
       wait for clk_period*1;
        
        data_in <="1010";
        
        
          -- n=11
       wait for clk_period*1;
        
        data_in <="1011";
        
        
          -- n=12
       wait for clk_period*1;
        
        data_in <="1100";
        
          -- n=13
       wait for clk_period*1;
        
        data_in <="1101";
        
        
          -- n=14
       wait for clk_period*1;
        
        data_in <="1110";
        
        
          -- n=15
       wait for clk_period*1;
        
        data_in <="1111";
       
        wait for clk_period*1;
		
        wait;

   end process;

END;




