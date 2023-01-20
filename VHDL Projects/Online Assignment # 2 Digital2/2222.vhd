LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF  test IS 
 
   
 COMPONENT multiplier
   port( CLK : in std_logic;
 A, B : in std_logic_vector(3 downto 0);
 P : out std_logic_vector(7 downto 0));
 
  END COMPONENT;
    

  
   signal clk : std_logic := '0';
   signal A : std_logic_vector(3 downto 0);
    signal B : std_logic_vector(3 downto 0);

   signal P : std_logic_vector(7 downto 0);

   
   constant clk_period : time := 0.5 ns;
 
BEGIN
 
	
    MM: multiplier PORT MAP (
          clk => clk,
         A =>A,
          B => B,
         P => P
        );

  
  process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
        
		wait for clk_period/2;
   end process;
 

  
    NN: process
    
    variable K : std_logic_vector (3 downto 0):=(others=> '0');
    variable N : std_logic_vector (3 downto 0):=(others=> '0');
   begin		
     
     
     K:="0000";
     N:="0000";
       for I in 0 to 15 loop
       
                  for S in 0 to 15 loop
                         A<=K;
                         B<=N;
                         K:=K+'1';
                        wait for clk_period;
                       
                    end loop;
                     wait for clk_period;
                       K:="0000";
                        N:=N +'1';

        end loop;
   
     
      
        wait;

   end process;

END;




