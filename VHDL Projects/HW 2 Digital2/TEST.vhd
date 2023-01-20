 LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TEST IS
END TEST;
 
 
 
 
ARCHITECTURE behavior OF TEST IS 
------------------COMPONENT-----------------
 --------------------------------------------
   COMPONENT Parallel_To_Serial 
  port(
 CLK, RESET, WR: in std_logic;
 
 Data : in std_logic_vector(6 downto 0) ;
 
 TXD : out std_logic );
 
  END COMPONENT;
  -------------------------------------------
 
 
 
 
 --------------------Inputs----------------------
-------------------------------------------------
   signal clk : std_logic := '0';
 signal RESET : std_logic := '0';
   signal WR : std_logic := '0';
   signal Data : std_logic_vector(6 downto 0);
------------------------------------------------





-------------Outputs----------------------------
-------------------------------------------------
signal TXD: std_logic := '0';
------------------------------------------------





------------- Clock period definitions------------
--------------------------------------------------
   constant clk_period : time := 10 ns;
--------------------------------------------------
 
 
 
 
 
--------------BEGIN  behavior-------------------
-----------------------------------------------
BEGIN
 
 
 
------------PORT MAP for Parallel_To_Serial----
---------------------------------------------
   n1: Parallel_To_Serial PORT MAP (
          CLK => CLK,
          RESET => RESET,
         WR => WR,
       Data => Data ,
       TXD=>TXD  );
-----------------------------------------





---------------clk process-------------
---------------------------------------
 process
   begin
		CLK <= '0';
		wait for clk_period/2;
		CLK <= '1';
		wait for clk_period/2;
   end process;
-------------------------------------- 


---------------test process----------
------------------------------------
 BB: process
   begin
   
   -- 1
    RESET<='0';
    WR<='0';
  
    wait for clk_period*5; 
    --2
     RESET<='1';
    WR<='0';
  
    wait for clk_period*3;
    --3
     RESET<='1';
    WR<='1';
 DATA <="1010100";
  wait for clk_period*2;
  --4
     RESET<='1';
    WR<='0';
 DATA <="1010100";
  wait for clk_period*15;
  --5
  RESET<='1';
    WR<='1';
 DATA <="1011100";
  wait for clk_period*2;
  
  --6
   RESET<='1';
    WR<='0';
 DATA <="1011100";
  wait for clk_period*15;
  
  --7
  
   RESET<='1';
    WR<='1';
 DATA <="0000000";
  wait for clk_period*2;
  --8
   RESET<='1';
    WR<='0';
 DATA <="0000000";
  wait for clk_period*15;
  --9
   RESET<='1';
    WR<='1';
 DATA <="1111111";
  wait for clk_period*2;
  --10
   RESET<='1';
    WR<='0';
 DATA <="1111111";
  wait for clk_period*15;
  --11
   RESET<='0';
 
  wait for clk_period*5;
   
        wait;

   end process;
-------------------------------------

END;




